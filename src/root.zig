//! Author: Patrick Ikongha
//! Date: 2025-06-20
//! Description: A dice db sdk implementation
//! for the zig programming language

const std = @import("std");
const net = std.net;
const testing = std.testing;
const print = std.debug.print;

const uuid4 = @import("uuid").UUID;
const proto_wire = @import("./internals/protobuf_wire.zig");

const ProtobufTcpWire = proto_wire.ProtobufTcpWire;

const Result = proto_wire.Result;
const CommandReader = proto_wire.CommandReader;
const WireError = proto_wire.WireError;

pub const Command = proto_wire.Command;
pub const ResultReader = proto_wire.ResultReader;
pub const ResultStatus = proto_wire.wire.res.Status;


const max_request_size: usize = 32 * 1024 * 1024; // 32 MB

const CommandOrString = union(enum) {
    cmd: Command,
    str: []const u8,
};

const ClientOptions = struct {
    withId: []const u8 = "",
    retry: u4 = 0,
};

pub const Client = struct {
    /// id of the connection beign made
    id: *uuid4 = undefined,

    /// dice db connection parameters
    port: u16,
    host: []const u8,

    /// the connection stream 
    conn: *net.Stream,
    /// a flag to check if an active connection exist 
    /// used to avoid double free or freeing non-existing connections   
    is_connected: bool = false,

    /// the main tcp wire
    main_wire: *ProtobufTcpWire,

    /// the default allocator provided by the user
    default_allocator: std.mem.Allocator,

    /// an arena allocator created from the default allocator 
    allocator: std.mem.Allocator,
    arena : std.heap.ArenaAllocator,

    /// create a new connection to dice db server 
    pub fn newConn(alloc: std.mem.Allocator, host: []const u8, port: u16, options: ClientOptions) !Client {

        var arena = std.heap.ArenaAllocator.init(alloc);
        
        const allocator = arena.allocator();

        const address = try std.net.Address.parseIp4(host, port);
        const stream = try allocator.create(net.Stream);

        // handle connection retries if retry option is set
        for (0..options.retry + 1) |i| {
            stream.* = net.tcpConnectToAddress(address) catch |err| {
                if (i == options.retry) {
                    allocator.destroy(stream);
                    return err;
                } else {
                    print("dicedb connection failed {}\n", .{i});
                    continue;
                }
            };
        }

        // create a new uuid or use existing if one is provided
        const id: *uuid4 = try allocator.create(uuid4);

        id.* = try if (options.withId.len < 1) uuid4.init() else uuid4.parse(options.withId);

        // create a main Wire instance for handling sends and recieves  
        const main_wire = try allocator.create(ProtobufTcpWire);
        main_wire.* = ProtobufTcpWire.init(allocator, max_request_size, stream);

        // handshake connection
        const id_str = &id.*.to_string();
        const slice: []const u8 = id_str.*[0..id_str.len];

        const args: ?[]const ?[]const u8 = &.{ slice, "command" };

        const cmd = Command{ .cmd = "HANDSHAKE", .args = args };

        const result = Client._fire(allocator, cmd, main_wire);

        if (result.getStatus() != ResultStatus.OK) {
            return WireError.NotEstablished;
        }

        return .{ 
            .id = id, 
            .host = host, 
            .port = port, 
            .conn = stream, 
            .arena = arena,
            .allocator = allocator, 
            .default_allocator = alloc,
            .is_connected = true, 
            .main_wire = main_wire
        };
    }


    pub fn deinit(self: *Client) void {
        // free allocated heap data and close connections
        const allocator = self.allocator;
        if (self.is_connected) {
            self.conn.*.close();
            allocator.destroy(self.conn);
        }
        allocator.destroy(self.id);
        self.arena.deinit();
    }

    fn _fire(
        allocator: std.mem.Allocator,
        c: Command,
        wire: *ProtobufTcpWire,
    ) ResultReader {
        // a static function to fire a request over a protobuf tcp wire and get a ResultReader 


        // TODO: check if connection is dead and reopen

        wire.send(c) catch |err| {
            const message: ?[]const u8 = switch (err) {
                WireError.Terminated => "failed to send command, connection terminated",
                WireError.Terminated_BrokenPipe => "failed to send command, connection terminated: BrokenPipe",

                WireError.Terminated_MaxRetriesReached => "failed to send command, connection terminated: MaximumRetriesReached",

                WireError.OutOfMemory => "Failed to send: OutOfMemory",

                else => "failed to send command: unrecognized error, this should be reported to DiceDB maintainers",
            };

            return Client.format_result(allocator, Result{ .status = ResultStatus.ERR, .message = message });
        };

        const result = wire.recieve() catch |err| {
            const message: ?[]const u8 = std.fmt.allocPrint(allocator, "failed to receive response: {any}", .{err}) catch return Client.format_result(allocator, Result{ .status = ResultStatus.ERR, .message = "failed to receive response: OutOfMemeory" });

            return Client.format_result(allocator, Result{ .status = ResultStatus.ERR, .message = message });
        };

        return result;
    }

    pub fn fire(self: *Client, c: CommandOrString) ResultReader {
        
        const cmd: Command = switch (c) {
            .cmd => |cmd| res: {
                break :res cmd;
            },
            .str => |str| res: {
                break :res self.formatCommandFromString(str) catch return Client.format_result(self.allocator, Result{ .status = ResultStatus.ERR, .message = "failed to receive response: OutOfMemeory" });
            },
        };

        return Client._fire(self.allocator, cmd, self.main_wire);
    }

    fn formatCommandFromString(self: *Client, cmd_str: []const u8) !Command {
        const trimmed = std.mem.trim(u8, cmd_str, &std.ascii.whitespace);
        
        var tokens = std.mem.splitSequence(u8, trimmed, " ");
        const cmd: ?[]const u8 = tokens.next() orelse null;


        var argsList = std.ArrayList(?[]const u8).init(self.default_allocator);
        defer argsList.deinit();

        while (tokens.next()) |arg| {
            try argsList.append(arg);
        }

        const args: ?[]const ?[]const u8 =  try argsList.toOwnedSlice();

        // this line is to stop a seg fault that disapears during a print
        _ = std.fmt.format(std.io.null_writer, " {any}",  .{args}) catch null;


        return Command{
            .cmd = cmd,
            .args =  args
        };
    }

    fn format_result(allocator: std.mem.Allocator, res: Result) ResultReader {
        const encoded = res.encode(allocator) catch {
            return ResultReader{ ._status = ResultStatus.ERR, ._message = "decoding error" };
        };

        defer allocator.free(encoded);

        return ResultReader.init(allocator, encoded) catch {
            return ResultReader{ ._status = ResultStatus.ERR, ._message = "decoding error" };
        };
    }

    /// Implements the fmt.Format interface for printing.
    pub fn format(
        self: Client,
        comptime _: []const u8,
        _: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        const fmt = try std.fmt.allocPrint(self.allocator, "Client {{ \n  .id = {s}\n  .is_connected : {any},\n  .conn: std.net.Stream,\n  .host={s}, \n  .port={any}\n  .allocator=std.mem.allocator\n }}", .{ self.id, self.is_connected, self.host, self.port });
        defer self.allocator.free(fmt);
        try writer.writeAll(fmt);
    }
};

test "create new stream" {
    const allocator = std.testing.allocator;
    var client = try Client.newConn(allocator, "127.0.0.1", 7379, .{});
    defer client.deinit();
    try testing.expect(client.port == 7379);
}

test "test client fire" {
    const allocator = std.testing.allocator;
    var client = try Client.newConn(allocator, "127.0.0.1", 7379, .{});
    defer client.deinit();

    const args: ?[]const ?[]const u8 = &.{ };

    const result = client.fire(
        .{ 
            .cmd = Command{ 
                .cmd = "PING", 
                .args = args 
            } 
        }
    );

    const data = try result.getPINGRes(allocator);

    
    try testing.expectEqualStrings("PONG",  data.getMessage());
}