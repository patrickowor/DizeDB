const std = @import("std");
const gremlin = @import("gremlin");

// enums
pub const ElementType = enum(i32) {
    ELEMENT_TYPE_NOOP = 0,
    ELEMENT_TYPE_COMMAND = 1,
};

// structs
const ElementWire = struct {
    const LSN_WIRE: gremlin.ProtoWireNumber = 1;
    const TIMESTAMP_WIRE: gremlin.ProtoWireNumber = 2;
    const ELEMENT_TYPE_WIRE: gremlin.ProtoWireNumber = 3;
    const PAYLOAD_WIRE: gremlin.ProtoWireNumber = 4;
};

pub const Element = struct {
    // fields
    lsn: u64 = 0,
    timestamp: i64 = 0,
    element_type: ElementType = @enumFromInt(0),
    payload: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const Element) usize {
        var res: usize = 0;
        if (self.lsn != 0) {
            res += gremlin.sizes.sizeWireNumber(ElementWire.LSN_WIRE) + gremlin.sizes.sizeU64(self.lsn);
        }
        if (self.timestamp != 0) {
            res += gremlin.sizes.sizeWireNumber(ElementWire.TIMESTAMP_WIRE) + gremlin.sizes.sizeI64(self.timestamp);
        }
        if (@intFromEnum(self.element_type) != 0) {
            res += gremlin.sizes.sizeWireNumber(ElementWire.ELEMENT_TYPE_WIRE) + gremlin.sizes.sizeI32(@intFromEnum(self.element_type));
        }
        if (self.payload) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(ElementWire.PAYLOAD_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const Element, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const Element, target: *gremlin.Writer) void {
        if (self.lsn != 0) {
            target.appendUint64(ElementWire.LSN_WIRE, self.lsn);
        }
        if (self.timestamp != 0) {
            target.appendInt64(ElementWire.TIMESTAMP_WIRE, self.timestamp);
        }
        if (@intFromEnum(self.element_type) != 0) {
            target.appendInt32(ElementWire.ELEMENT_TYPE_WIRE, @intFromEnum(self.element_type));
        }
        if (self.payload) |v| {
            if (v.len > 0) {
                target.appendBytes(ElementWire.PAYLOAD_WIRE, v);
            }
        }
    }
};

pub const ElementReader = struct {
    _lsn: u64 = 0,
    _timestamp: i64 = 0,
    _element_type: ElementType = @enumFromInt(0),
    _payload: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ElementReader {
        var buf = gremlin.Reader.init(src);
        var res = ElementReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ElementWire.LSN_WIRE => {
                    const result = try buf.readUInt64(offset);
                    offset += result.size;
                    res._lsn = result.value;
                },
                ElementWire.TIMESTAMP_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._timestamp = result.value;
                },
                ElementWire.ELEMENT_TYPE_WIRE => {
                    const result = try buf.readInt32(offset);
                    offset += result.size;
                    res._element_type = @enumFromInt(result.value);
                },
                ElementWire.PAYLOAD_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._payload = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ElementReader) void {}

    pub inline fn getLsn(self: *const ElementReader) u64 {
        return self._lsn;
    }
    pub inline fn getTimestamp(self: *const ElementReader) i64 {
        return self._timestamp;
    }
    pub inline fn getElementType(self: *const ElementReader) ElementType {
        return self._element_type;
    }
    pub inline fn getPayload(self: *const ElementReader) []const u8 {
        return self._payload orelse &[_]u8{};
    }
};
