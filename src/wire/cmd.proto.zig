const std = @import("std");
const gremlin = @import("gremlin");

// structs
const CommandWire = struct {
    const CMD_WIRE: gremlin.ProtoWireNumber = 1;
    const ARGS_WIRE: gremlin.ProtoWireNumber = 2;
};

pub const Command = struct {
    // fields
    cmd: ?[]const u8 = null,
    args: ?[]const ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const Command) usize {
        var res: usize = 0;
        if (self.cmd) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(CommandWire.CMD_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        if (self.args) |arr| {
            for (arr) |maybe_v| {
                res += gremlin.sizes.sizeWireNumber(CommandWire.ARGS_WIRE);
                if (maybe_v) |v| {
                    res += gremlin.sizes.sizeUsize(v.len) + v.len;
                } else {
                    res += gremlin.sizes.sizeUsize(0);
                }
            }
        }
        return res;
    }

    pub fn encode(self: *const Command, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const Command, target: *gremlin.Writer) void {
        if (self.cmd) |v| {
            if (v.len > 0) {
                target.appendBytes(CommandWire.CMD_WIRE, v);
            }
        }
        if (self.args) |arr| {
            for (arr) |maybe_v| {
                if (maybe_v) |v| {
                    target.appendBytes(CommandWire.ARGS_WIRE, v);
                } else {
                    target.appendBytesTag(CommandWire.ARGS_WIRE, 0);
                }
            }
        }
    }
};

pub const CommandReader = struct {
    allocator: std.mem.Allocator,
    buf: gremlin.Reader,
    _cmd: ?[]const u8 = null,
    _args: ?std.ArrayList([]const u8) = null,

    pub fn init(allocator: std.mem.Allocator, src: []const u8) gremlin.Error!CommandReader {
        var buf = gremlin.Reader.init(src);
        var res = CommandReader{ .allocator = allocator, .buf = buf };
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                CommandWire.CMD_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._cmd = result.value;
                },
                CommandWire.ARGS_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    if (res._args == null) {
                        res._args = std.ArrayList([]const u8).init(allocator);
                    }
                    try res._args.?.append(result.value);
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(self: *const CommandReader) void {
        if (self._args) |arr| {
            arr.deinit();
        }
    }
    pub inline fn getCmd(self: *const CommandReader) []const u8 {
        return self._cmd orelse &[_]u8{};
    }
    pub fn getArgs(self: *const CommandReader) []const []const u8 {
        if (self._args) |arr| {
            return arr.items;
        }
        return &[_][]u8{};
    }
};
