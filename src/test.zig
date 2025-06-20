const Client = @import("root.zig").Client;
const std = @import("std");
const uuid4 = @import("uuid").UUID;
const tcp_wire = @import("./internals/tcp_wire.zig");

test "send tcp message" {
    var client = try Client.newConn(std.testing.allocator, "127.0.0.1", 7379, .{});
    defer client.deinit();

    const msg: [10]u8 = .{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const prefix: [4]u8 = .{ 0, 0, 0, msg.len };

    const buffer = prefix ++ msg;

    var wire = tcp_wire.TcpWire.newTCPWire(std.testing.allocator, 50, client.conn);
    defer wire.close();

    try wire.send(&buffer);
}

test "recieve tcp message" {
    var client = try Client.newConn(std.testing.allocator, "127.0.0.1", 7379, .{});
    defer client.deinit();

    const want: [10]u8 = .{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const prefix: [4]u8 = .{ 0, 0, 0, want.len };
    const buffer = prefix ++ want;

    var wire = tcp_wire.TcpWire.newTCPWire(std.testing.allocator, 50, client.conn);
    defer wire.close();

    const response = try wire.recieve();

    std.debug.print("{any}, {any}", .{ buffer, response });
}
