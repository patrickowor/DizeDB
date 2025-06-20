pub const wire = @import("../wire/wire.zig");
const WireError = wire.WireError;
const std = @import("std");
const net = std.net;
const ns_per_us: u64 = 1000;
const prefix_size: u8 = 4; // bytes
const Status = u8;
const Open: Status = 1;
const Closed: Status = 2;

pub const TcpWire = struct {
    status: Status,
    max_message_size: u32,
    conn: *net.Stream,
    allocator: std.mem.Allocator,

    pub fn newTCPWire(allocator: std.mem.Allocator, max_message_size: u32, conn: *net.Stream) TcpWire {
        return .{
            .status = Open,
            .max_message_size = max_message_size,
            // .client = client,
            .conn = conn,
            .allocator = allocator,
        };
    }

    pub fn send(w: *TcpWire, msg: []const u8) wire.WireError!void {
        // NOTE: might need a mutex lock
        if (w.*.status == Closed) return WireError.Terminated_ClosedPipe;

        const size: usize = msg.len;
        const required_capacity: usize = size + prefix_size;

        var buffer = std.ArrayList(u8).initCapacity(w.allocator, required_capacity) catch return WireError.OutOfMemory;
        defer buffer.deinit();

        // buffer.ensureUnusedCapacity() ;
        buffer.expandToCapacity();
        buffer.items.len = required_capacity;
        @memset(buffer.items, undefined);

        prefix(size, buffer.items.ptr);

        std.mem.copyForwards(u8, buffer.items.ptr[4..buffer.capacity], msg);

        // std.debug.print("res: {any}", .{ buffer.items });

        return w.write(buffer.toOwnedSlice() catch return WireError.OutOfMemory);
    }

    pub fn recieve(w: *TcpWire) WireError![]u8 {
        const size = try w.readPrefix();

        if (size < 0) {
            w.close();
            return WireError.CorruptMessage_InvalidMessageSize;
        }

        if (size > w.max_message_size) {
            w.close();
            return WireError.CorruptMessage_MessageTooLarge;
        }

        const buffer: []u8 = try w.readMessage(size);

        return buffer;
    }

    fn readPrefix(w: *TcpWire) WireError!u32 {
        var reader = w.conn.reader();
        var buffer: [prefix_size]u8 = undefined;

        reader.readNoEof(&buffer) catch |err| switch (err) {
            error.EndOfStream => return WireError.Empty,
            else => return WireError.Terminated,
        };
        return std.mem.readInt(u32, &buffer, .big);
    }

    fn readMessage(w: *TcpWire, size: u32) WireError![]u8 {
        var reader = w.conn.reader();
        const result_size: usize = @as(usize, size);
        var result = std.ArrayList(u8).initCapacity(w.allocator, result_size) catch {
            return WireError.OutOfMemory;
        };
        defer result.deinit();

        const ioBufferSize: usize = 16 * 1024;
        var recv_size: usize = 0;

        while (true) {
            var buffer: [ioBufferSize]u8 = undefined;

            const n = reader.read(&buffer) catch |err| switch (err) {
                error.BrokenPipe => return WireError.Terminated_BrokenPipe,
                error.ConnectionResetByPeer => return WireError.Terminated_ClosedPipe,
                else => return WireError.UnknownError,
            };

            if (n > 0) {
                if (recv_size + n > result_size) {
                    return WireError.CorruptMessage_MessageTooLarge;
                }
                recv_size += n;
                try result.appendSlice(buffer[0..n]);
            }

            if (n < ioBufferSize or recv_size == result_size) {
                break;
            }
        }

        if (result.items.len == 0) {
            return WireError.CorruptMessage_InvalidMessageSize;
        }
        return result.toOwnedSlice() catch {
            return WireError.OutOfMemory;
        };
    }

    fn write(w: *TcpWire, buffer: []u8) WireError!void {
        defer w.allocator.free(buffer);
        var total_written: usize = 0;
        var partial_write_retries: u8 = 0;

        // var backoff_retries :u8 = 0;

        const max_partial_write_retries: u8 = 10;

        // const max_backoff_retries :u8 = 5;
        // const backoff_delay: u64 = 5 * ns_per_us;

        const writer = w.conn.*.writer();

        // defer _= writer;
        // defer _= buffer;

        while (total_written < buffer.len) {
            var is_partial: bool = false;

            const n = writer.write(buffer[total_written..]) catch |err| switch (err) {
                error.WouldBlock => blk: {
                    is_partial = true;
                    break :blk 0;
                },
                error.BrokenPipe => {
                    w.status = Closed;
                    return WireError.Terminated_BrokenPipe;
                },
                else => return,
            };

            is_partial = n == 0 or n < buffer[total_written..].len or is_partial;
            total_written += n;

            if (is_partial) {
                if (partial_write_retries > max_partial_write_retries) {
                    w.status = Closed;
                    return WireError.Terminated_MaxRetriesReached;
                }
                partial_write_retries += 1;
                continue;
            }
        }
    }

    pub fn close(w: *TcpWire) void {
        if (w.status == Closed) return;
        w.status = Closed;
        // w.conn.close();
        // w.client.is_connected = false;
    }
};

pub fn prefix(msg_size: usize, buffer: [*]u8) void {
    std.mem.writeInt(u32, buffer[0..4], @as(u32, @intCast(msg_size)), .big);
}




test "recieve tcp message" {
    const allocator = std.testing.allocator;
    const address = try std.net.Address.parseIp4("127.0.0.1", 7379);
    var stream = try std.net.tcpConnectToAddress(address);
    defer stream.close();

    const want: [58]u8 = .{ 10, 9, 72, 65, 78, 68, 83, 72, 65, 75, 69, 18, 36, 57, 97, 50, 50, 101, 101, 54, 54, 45, 53, 55, 101, 98, 45, 52, 100, 57, 100, 45, 57, 97, 56, 56, 45, 49, 55, 57, 48, 100, 102, 98, 57, 99, 101, 49, 99, 18, 7, 99, 111, 109, 109, 97, 110, 100 };

    var test_wire = TcpWire.newTCPWire(allocator, 50, &stream);
    defer test_wire.close();

    try test_wire.send(&want);

    const recieved = try test_wire.recieve();
    defer allocator.free(recieved);

    try std.testing.expectEqualSlices(u8, &[_]u8{ 18, 2, 79, 75, 114, 0 }, recieved);
}

test "send tcp message" {
    const address = try std.net.Address.parseIp4("127.0.0.1", 7379);
    var stream = try std.net.tcpConnectToAddress(address);
    defer stream.close();

    const msg: [10]u8 = .{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const _prefix: [4]u8 = .{ 0, 0, 0, msg.len };

    const buffer = _prefix ++ msg;

    var test_wire = TcpWire.newTCPWire(std.testing.allocator, 50, &stream);
    defer test_wire.close();

    try test_wire.send(&buffer);
}