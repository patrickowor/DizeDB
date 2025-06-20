pub const wire = @import("../wire/wire.zig");
const TcpWire = @import("./tcp_wire.zig").TcpWire;
const std = @import("std");
const net = std.net;

pub const Command = wire.cmd.Command;
pub const Result = wire.res.Result;
pub const CommandReader = wire.cmd.CommandReader;
pub const ResultReader = wire.res.ResultReader;
pub const WireError = wire.WireError;

pub const ProtobufTcpWire = struct {
    tcpWire: TcpWire,

    pub fn init(allocator: std.mem.Allocator, max_message_size: u32, conn: *net.Stream) ProtobufTcpWire {
        return .{ .tcpWire = TcpWire.newTCPWire(allocator, max_message_size, conn) };
    }

    pub fn send(w: *ProtobufTcpWire, msg: Command) wire.WireError!void {
        const message = msg.encode(w.tcpWire.allocator) catch |err| {
            std.debug.print("Error: {}", .{err});
            return wire.WireError.UnknownError;
        };
        try w.tcpWire.send(message);
    }

    pub fn recieve(w: *ProtobufTcpWire) wire.WireError!ResultReader {
        const buffer = try w.tcpWire.recieve();
        return ResultReader.init(w.tcpWire.allocator, buffer) catch |err| {
            std.debug.print("Error: {}", .{err});

            return wire.WireError.UnknownError;
        };
    }

    pub fn close(w: *ProtobufTcpWire) void {
        w.tcpWire.close();
    }
};
