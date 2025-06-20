const lib = @import("dizeDB");
const std = @import("std");
const print = std.debug.print;
const Command = lib.Command;
const ResultReader = lib.ResultReader;

pub fn main() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    const allocator = gpa.allocator();

    var client = try lib.Client.newConn(allocator, "127.0.0.1", 7379, .{ .retry = 3 });
    defer client.deinit();

    {
        const args1: ?[]const ?[]const u8 = &.{ "HELLO", "THIS IS A TEST" };

        const result1: ResultReader = client.fire(.{ .cmd = Command{ .cmd = "SET", .args = args1 } });
        defer result1.deinit();

        print("SET: {any} {?s}\n", .{ result1.getStatus(), result1.getMessage() });
    }

    {
        const args2: ?[]const ?[]const u8 = &.{"HELLO"};

        const result2: ResultReader = client.fire(.{ .cmd = Command{ .cmd = "GET", .args = args2 } });

        defer result2.deinit();

        const data = try result2.getGETRes(allocator);
        defer data.deinit();

        print("GET: {any} {s}\n", .{ result2.getStatus(), data.getValue() });
    }

    {
        const result3 = client.fire(.{.str = "SET HI 7"});
        defer result3.deinit();
        print("SET: {any} {s}\n", .{ result3.getStatus(), result3.getMessage() });
    }



    const result4 = client.fire(.{.str = "GET HI"});

    const data2 = try result4.getGETRes(allocator);

    print("GET: {any} {s}\n", .{ result4.getStatus(), data2.getValue() });
    
}
