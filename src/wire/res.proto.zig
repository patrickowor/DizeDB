const std = @import("std");
const gremlin = @import("gremlin");

// enums
pub const Status = enum(i32) {
    OK = 0,
    ERR = 1,
};

// structs
const ResultWire = struct {
    const STATUS_WIRE: gremlin.ProtoWireNumber = 1;
    const MESSAGE_WIRE: gremlin.ProtoWireNumber = 2;
    const FINGERPRINT64_WIRE: gremlin.ProtoWireNumber = 3;
    const TYPERES_WIRE: gremlin.ProtoWireNumber = 11;
    const PINGRES_WIRE: gremlin.ProtoWireNumber = 12;
    const ECHORES_WIRE: gremlin.ProtoWireNumber = 13;
    const HANDSHAKERES_WIRE: gremlin.ProtoWireNumber = 14;
    const EXISTSRES_WIRE: gremlin.ProtoWireNumber = 15;
    const GETRES_WIRE: gremlin.ProtoWireNumber = 16;
    const SETRES_WIRE: gremlin.ProtoWireNumber = 17;
    const DELRES_WIRE: gremlin.ProtoWireNumber = 18;
    const KEYSRES_WIRE: gremlin.ProtoWireNumber = 19;
    const GETDELRES_WIRE: gremlin.ProtoWireNumber = 20;
    const GETEXRES_WIRE: gremlin.ProtoWireNumber = 21;
    const GETSETRES_WIRE: gremlin.ProtoWireNumber = 22;
    const INCRRES_WIRE: gremlin.ProtoWireNumber = 23;
    const DECRRES_WIRE: gremlin.ProtoWireNumber = 24;
    const INCRBYRES_WIRE: gremlin.ProtoWireNumber = 25;
    const DECRBYRES_WIRE: gremlin.ProtoWireNumber = 26;
    const FLUSHDBRES_WIRE: gremlin.ProtoWireNumber = 27;
    const EXPIRERES_WIRE: gremlin.ProtoWireNumber = 28;
    const EXPIREATRES_WIRE: gremlin.ProtoWireNumber = 29;
    const EXPIRETIMERES_WIRE: gremlin.ProtoWireNumber = 30;
    const TTLRES_WIRE: gremlin.ProtoWireNumber = 31;
    const GETWATCHRES_WIRE: gremlin.ProtoWireNumber = 32;
    const UNWATCHRES_WIRE: gremlin.ProtoWireNumber = 33;
    const HGETRES_WIRE: gremlin.ProtoWireNumber = 34;
    const HSETRES_WIRE: gremlin.ProtoWireNumber = 35;
    const HGETALLRES_WIRE: gremlin.ProtoWireNumber = 36;
    const HGETWATCHRES_WIRE: gremlin.ProtoWireNumber = 37;
    const HGETALLWATCHRES_WIRE: gremlin.ProtoWireNumber = 38;
    const ZADDRES_WIRE: gremlin.ProtoWireNumber = 39;
    const ZCOUNTRES_WIRE: gremlin.ProtoWireNumber = 40;
    const ZRANGERES_WIRE: gremlin.ProtoWireNumber = 41;
    const ZPOPMAXRES_WIRE: gremlin.ProtoWireNumber = 42;
    const ZREMRES_WIRE: gremlin.ProtoWireNumber = 43;
    const ZPOPMINRES_WIRE: gremlin.ProtoWireNumber = 44;
    const ZRANKRES_WIRE: gremlin.ProtoWireNumber = 45;
    const ZCARDRES_WIRE: gremlin.ProtoWireNumber = 46;
    const ZRANGEWATCHRES_WIRE: gremlin.ProtoWireNumber = 47;
    const ZCOUNTWATCHRES_WIRE: gremlin.ProtoWireNumber = 48;
    const ZCARDWATCHRES_WIRE: gremlin.ProtoWireNumber = 49;
    const ZRANKWATCHRES_WIRE: gremlin.ProtoWireNumber = 50;
};

pub const Result = struct {
    // fields
    status: Status = @enumFromInt(0),
    message: ?[]const u8 = null,
    fingerprint64: u64 = 0,
    t_y_p_e_res: ?TYPERes = null,
    p_i_n_g_res: ?PINGRes = null,
    e_c_h_o_res: ?ECHORes = null,
    h_a_n_d_s_h_a_k_e_res: ?HANDSHAKERes = null,
    e_x_i_s_t_s_res: ?EXISTSRes = null,
    g_e_t_res: ?GETRes = null,
    s_e_t_res: ?SETRes = null,
    d_e_l_res: ?DELRes = null,
    k_e_y_s_res: ?KEYSRes = null,
    g_e_t_d_e_l_res: ?GETDELRes = null,
    g_e_t_e_x_res: ?GETEXRes = null,
    g_e_t_s_e_t_res: ?GETSETRes = null,
    i_n_c_r_res: ?INCRRes = null,
    d_e_c_r_res: ?DECRRes = null,
    i_n_c_r_b_y_res: ?INCRBYRes = null,
    d_e_c_r_b_y_res: ?DECRBYRes = null,
    f_l_u_s_h_d_b_res: ?FLUSHDBRes = null,
    e_x_p_i_r_e_res: ?EXPIRERes = null,
    e_x_p_i_r_e_a_t_res: ?EXPIREATRes = null,
    e_x_p_i_r_e_t_i_m_e_res: ?EXPIRETIMERes = null,
    t_t_l_res: ?TTLRes = null,
    g_e_t_w_a_t_c_h_res: ?GETWATCHRes = null,
    u_n_w_a_t_c_h_res: ?UNWATCHRes = null,
    h_g_e_t_res: ?HGETRes = null,
    h_s_e_t_res: ?HSETRes = null,
    h_g_e_t_a_l_l_res: ?HGETALLRes = null,
    h_g_e_t_w_a_t_c_h_res: ?HGETWATCHRes = null,
    h_g_e_t_a_l_l_w_a_t_c_h_res: ?HGETALLWATCHRes = null,
    z_a_d_d_res: ?ZADDRes = null,
    z_c_o_u_n_t_res: ?ZCOUNTRes = null,
    z_r_a_n_g_e_res: ?ZRANGERes = null,
    z_p_o_p_m_a_x_res: ?ZPOPMAXRes = null,
    z_r_e_m_res: ?ZREMRes = null,
    z_p_o_p_m_i_n_res: ?ZPOPMINRes = null,
    z_r_a_n_k_res: ?ZRANKRes = null,
    z_c_a_r_d_res: ?ZCARDRes = null,
    z_r_a_n_g_e_w_a_t_c_h_res: ?ZRANGEWATCHRes = null,
    z_c_o_u_n_t_w_a_t_c_h_res: ?ZCOUNTWATCHRes = null,
    z_c_a_r_d_w_a_t_c_h_res: ?ZCARDWATCHRes = null,
    z_r_a_n_k_w_a_t_c_h_res: ?ZRANKWATCHRes = null,

    pub fn calcProtobufSize(self: *const Result) usize {
        var res: usize = 0;
        if (@intFromEnum(self.status) != 0) {
            res += gremlin.sizes.sizeWireNumber(ResultWire.STATUS_WIRE) + gremlin.sizes.sizeI32(@intFromEnum(self.status));
        }
        if (self.message) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.MESSAGE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        if (self.fingerprint64 != 0) {
            res += gremlin.sizes.sizeWireNumber(ResultWire.FINGERPRINT64_WIRE) + gremlin.sizes.sizeU64(self.fingerprint64);
        }
        if (self.t_y_p_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.TYPERES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.p_i_n_g_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.PINGRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.e_c_h_o_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ECHORES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.h_a_n_d_s_h_a_k_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.HANDSHAKERES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.e_x_i_s_t_s_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.EXISTSRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.g_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.GETRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.s_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.SETRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.d_e_l_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.DELRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.k_e_y_s_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.KEYSRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.g_e_t_d_e_l_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.GETDELRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.g_e_t_e_x_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.GETEXRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.g_e_t_s_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.GETSETRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.i_n_c_r_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.INCRRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.d_e_c_r_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.DECRRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.i_n_c_r_b_y_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.INCRBYRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.d_e_c_r_b_y_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.DECRBYRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.f_l_u_s_h_d_b_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.FLUSHDBRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.e_x_p_i_r_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.EXPIRERES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.e_x_p_i_r_e_a_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.EXPIREATRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.e_x_p_i_r_e_t_i_m_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.EXPIRETIMERES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.t_t_l_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.TTLRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.g_e_t_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.GETWATCHRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.u_n_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.UNWATCHRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.h_g_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.HGETRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.h_s_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.HSETRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.h_g_e_t_a_l_l_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.HGETALLRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.h_g_e_t_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.HGETWATCHRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.h_g_e_t_a_l_l_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.HGETALLWATCHRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_a_d_d_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZADDRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_c_o_u_n_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZCOUNTRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_r_a_n_g_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZRANGERES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_p_o_p_m_a_x_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZPOPMAXRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_r_e_m_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZREMRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_p_o_p_m_i_n_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZPOPMINRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_r_a_n_k_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZRANKRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_c_a_r_d_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZCARDRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_r_a_n_g_e_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZRANGEWATCHRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_c_o_u_n_t_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZCOUNTWATCHRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_c_a_r_d_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZCARDWATCHRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        if (self.z_r_a_n_k_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ResultWire.ZRANKWATCHRES_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        return res;
    }

    pub fn encode(self: *const Result, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const Result, target: *gremlin.Writer) void {
        if (@intFromEnum(self.status) != 0) {
            target.appendInt32(ResultWire.STATUS_WIRE, @intFromEnum(self.status));
        }
        if (self.message) |v| {
            if (v.len > 0) {
                target.appendBytes(ResultWire.MESSAGE_WIRE, v);
            }
        }
        if (self.fingerprint64 != 0) {
            target.appendUint64(ResultWire.FINGERPRINT64_WIRE, self.fingerprint64);
        }
        if (self.t_y_p_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.TYPERES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.p_i_n_g_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.PINGRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.e_c_h_o_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ECHORES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.h_a_n_d_s_h_a_k_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.HANDSHAKERES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.e_x_i_s_t_s_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.EXISTSRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.g_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.GETRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.s_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.SETRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.d_e_l_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.DELRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.k_e_y_s_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.KEYSRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.g_e_t_d_e_l_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.GETDELRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.g_e_t_e_x_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.GETEXRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.g_e_t_s_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.GETSETRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.i_n_c_r_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.INCRRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.d_e_c_r_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.DECRRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.i_n_c_r_b_y_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.INCRBYRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.d_e_c_r_b_y_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.DECRBYRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.f_l_u_s_h_d_b_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.FLUSHDBRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.e_x_p_i_r_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.EXPIRERES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.e_x_p_i_r_e_a_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.EXPIREATRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.e_x_p_i_r_e_t_i_m_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.EXPIRETIMERES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.t_t_l_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.TTLRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.g_e_t_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.GETWATCHRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.u_n_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.UNWATCHRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.h_g_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.HGETRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.h_s_e_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.HSETRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.h_g_e_t_a_l_l_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.HGETALLRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.h_g_e_t_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.HGETWATCHRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.h_g_e_t_a_l_l_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.HGETALLWATCHRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_a_d_d_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZADDRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_c_o_u_n_t_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZCOUNTRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_r_a_n_g_e_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZRANGERES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_p_o_p_m_a_x_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZPOPMAXRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_r_e_m_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZREMRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_p_o_p_m_i_n_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZPOPMINRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_r_a_n_k_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZRANKRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_c_a_r_d_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZCARDRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_r_a_n_g_e_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZRANGEWATCHRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_c_o_u_n_t_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZCOUNTWATCHRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_c_a_r_d_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZCARDWATCHRES_WIRE, size);
                v.encodeTo(target);
            }
        }
        if (self.z_r_a_n_k_w_a_t_c_h_res) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ResultWire.ZRANKWATCHRES_WIRE, size);
                v.encodeTo(target);
            }
        }
    }
};

pub const ResultReader = struct {
    _status: Status = @enumFromInt(0),
    _message: ?[]const u8 = null,
    _fingerprint64: u64 = 0,
    _t_y_p_e_res_buf: ?[]const u8 = null,
    _p_i_n_g_res_buf: ?[]const u8 = null,
    _e_c_h_o_res_buf: ?[]const u8 = null,
    _h_a_n_d_s_h_a_k_e_res_buf: ?[]const u8 = null,
    _e_x_i_s_t_s_res_buf: ?[]const u8 = null,
    _g_e_t_res_buf: ?[]const u8 = null,
    _s_e_t_res_buf: ?[]const u8 = null,
    _d_e_l_res_buf: ?[]const u8 = null,
    _k_e_y_s_res_buf: ?[]const u8 = null,
    _g_e_t_d_e_l_res_buf: ?[]const u8 = null,
    _g_e_t_e_x_res_buf: ?[]const u8 = null,
    _g_e_t_s_e_t_res_buf: ?[]const u8 = null,
    _i_n_c_r_res_buf: ?[]const u8 = null,
    _d_e_c_r_res_buf: ?[]const u8 = null,
    _i_n_c_r_b_y_res_buf: ?[]const u8 = null,
    _d_e_c_r_b_y_res_buf: ?[]const u8 = null,
    _f_l_u_s_h_d_b_res_buf: ?[]const u8 = null,
    _e_x_p_i_r_e_res_buf: ?[]const u8 = null,
    _e_x_p_i_r_e_a_t_res_buf: ?[]const u8 = null,
    _e_x_p_i_r_e_t_i_m_e_res_buf: ?[]const u8 = null,
    _t_t_l_res_buf: ?[]const u8 = null,
    _g_e_t_w_a_t_c_h_res_buf: ?[]const u8 = null,
    _u_n_w_a_t_c_h_res_buf: ?[]const u8 = null,
    _h_g_e_t_res_buf: ?[]const u8 = null,
    _h_s_e_t_res_buf: ?[]const u8 = null,
    _h_g_e_t_a_l_l_res_buf: ?[]const u8 = null,
    _h_g_e_t_w_a_t_c_h_res_buf: ?[]const u8 = null,
    _h_g_e_t_a_l_l_w_a_t_c_h_res_buf: ?[]const u8 = null,
    _z_a_d_d_res_buf: ?[]const u8 = null,
    _z_c_o_u_n_t_res_buf: ?[]const u8 = null,
    _z_r_a_n_g_e_res_buf: ?[]const u8 = null,
    _z_p_o_p_m_a_x_res_buf: ?[]const u8 = null,
    _z_r_e_m_res_buf: ?[]const u8 = null,
    _z_p_o_p_m_i_n_res_buf: ?[]const u8 = null,
    _z_r_a_n_k_res_buf: ?[]const u8 = null,
    _z_c_a_r_d_res_buf: ?[]const u8 = null,
    _z_r_a_n_g_e_w_a_t_c_h_res_buf: ?[]const u8 = null,
    _z_c_o_u_n_t_w_a_t_c_h_res_buf: ?[]const u8 = null,
    _z_c_a_r_d_w_a_t_c_h_res_buf: ?[]const u8 = null,
    _z_r_a_n_k_w_a_t_c_h_res_buf: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ResultReader {
        var buf = gremlin.Reader.init(src);
        var res = ResultReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ResultWire.STATUS_WIRE => {
                    const result = try buf.readInt32(offset);
                    offset += result.size;
                    res._status = @enumFromInt(result.value);
                },
                ResultWire.MESSAGE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._message = result.value;
                },
                ResultWire.FINGERPRINT64_WIRE => {
                    const result = try buf.readUInt64(offset);
                    offset += result.size;
                    res._fingerprint64 = result.value;
                },
                ResultWire.TYPERES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._t_y_p_e_res_buf = result.value;
                },
                ResultWire.PINGRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._p_i_n_g_res_buf = result.value;
                },
                ResultWire.ECHORES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._e_c_h_o_res_buf = result.value;
                },
                ResultWire.HANDSHAKERES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._h_a_n_d_s_h_a_k_e_res_buf = result.value;
                },
                ResultWire.EXISTSRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._e_x_i_s_t_s_res_buf = result.value;
                },
                ResultWire.GETRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._g_e_t_res_buf = result.value;
                },
                ResultWire.SETRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._s_e_t_res_buf = result.value;
                },
                ResultWire.DELRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._d_e_l_res_buf = result.value;
                },
                ResultWire.KEYSRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._k_e_y_s_res_buf = result.value;
                },
                ResultWire.GETDELRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._g_e_t_d_e_l_res_buf = result.value;
                },
                ResultWire.GETEXRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._g_e_t_e_x_res_buf = result.value;
                },
                ResultWire.GETSETRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._g_e_t_s_e_t_res_buf = result.value;
                },
                ResultWire.INCRRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._i_n_c_r_res_buf = result.value;
                },
                ResultWire.DECRRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._d_e_c_r_res_buf = result.value;
                },
                ResultWire.INCRBYRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._i_n_c_r_b_y_res_buf = result.value;
                },
                ResultWire.DECRBYRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._d_e_c_r_b_y_res_buf = result.value;
                },
                ResultWire.FLUSHDBRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._f_l_u_s_h_d_b_res_buf = result.value;
                },
                ResultWire.EXPIRERES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._e_x_p_i_r_e_res_buf = result.value;
                },
                ResultWire.EXPIREATRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._e_x_p_i_r_e_a_t_res_buf = result.value;
                },
                ResultWire.EXPIRETIMERES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._e_x_p_i_r_e_t_i_m_e_res_buf = result.value;
                },
                ResultWire.TTLRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._t_t_l_res_buf = result.value;
                },
                ResultWire.GETWATCHRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._g_e_t_w_a_t_c_h_res_buf = result.value;
                },
                ResultWire.UNWATCHRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._u_n_w_a_t_c_h_res_buf = result.value;
                },
                ResultWire.HGETRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._h_g_e_t_res_buf = result.value;
                },
                ResultWire.HSETRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._h_s_e_t_res_buf = result.value;
                },
                ResultWire.HGETALLRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._h_g_e_t_a_l_l_res_buf = result.value;
                },
                ResultWire.HGETWATCHRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._h_g_e_t_w_a_t_c_h_res_buf = result.value;
                },
                ResultWire.HGETALLWATCHRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._h_g_e_t_a_l_l_w_a_t_c_h_res_buf = result.value;
                },
                ResultWire.ZADDRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_a_d_d_res_buf = result.value;
                },
                ResultWire.ZCOUNTRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_c_o_u_n_t_res_buf = result.value;
                },
                ResultWire.ZRANGERES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_r_a_n_g_e_res_buf = result.value;
                },
                ResultWire.ZPOPMAXRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_p_o_p_m_a_x_res_buf = result.value;
                },
                ResultWire.ZREMRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_r_e_m_res_buf = result.value;
                },
                ResultWire.ZPOPMINRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_p_o_p_m_i_n_res_buf = result.value;
                },
                ResultWire.ZRANKRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_r_a_n_k_res_buf = result.value;
                },
                ResultWire.ZCARDRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_c_a_r_d_res_buf = result.value;
                },
                ResultWire.ZRANGEWATCHRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_r_a_n_g_e_w_a_t_c_h_res_buf = result.value;
                },
                ResultWire.ZCOUNTWATCHRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_c_o_u_n_t_w_a_t_c_h_res_buf = result.value;
                },
                ResultWire.ZCARDWATCHRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_c_a_r_d_w_a_t_c_h_res_buf = result.value;
                },
                ResultWire.ZRANKWATCHRES_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._z_r_a_n_k_w_a_t_c_h_res_buf = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ResultReader) void {}

    pub inline fn getStatus(self: *const ResultReader) Status {
        return self._status;
    }
    pub inline fn getMessage(self: *const ResultReader) []const u8 {
        return self._message orelse &[_]u8{};
    }
    pub inline fn getFingerprint64(self: *const ResultReader) u64 {
        return self._fingerprint64;
    }
    pub fn getTYPERes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!TYPEResReader {
        if (self._t_y_p_e_res_buf) |buf| {
            return try TYPEResReader.init(allocator, buf);
        }
        return try TYPEResReader.init(allocator, &[_]u8{});
    }
    pub fn getPINGRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!PINGResReader {
        if (self._p_i_n_g_res_buf) |buf| {
            return try PINGResReader.init(allocator, buf);
        }
        return try PINGResReader.init(allocator, &[_]u8{});
    }
    pub fn getECHORes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ECHOResReader {
        if (self._e_c_h_o_res_buf) |buf| {
            return try ECHOResReader.init(allocator, buf);
        }
        return try ECHOResReader.init(allocator, &[_]u8{});
    }
    pub fn getHANDSHAKERes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!HANDSHAKEResReader {
        if (self._h_a_n_d_s_h_a_k_e_res_buf) |buf| {
            return try HANDSHAKEResReader.init(allocator, buf);
        }
        return try HANDSHAKEResReader.init(allocator, &[_]u8{});
    }
    pub fn getEXISTSRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!EXISTSResReader {
        if (self._e_x_i_s_t_s_res_buf) |buf| {
            return try EXISTSResReader.init(allocator, buf);
        }
        return try EXISTSResReader.init(allocator, &[_]u8{});
    }
    pub fn getGETRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!GETResReader {
        if (self._g_e_t_res_buf) |buf| {
            return try GETResReader.init(allocator, buf);
        }
        return try GETResReader.init(allocator, &[_]u8{});
    }
    pub fn getSETRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!SETResReader {
        if (self._s_e_t_res_buf) |buf| {
            return try SETResReader.init(allocator, buf);
        }
        return try SETResReader.init(allocator, &[_]u8{});
    }
    pub fn getDELRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!DELResReader {
        if (self._d_e_l_res_buf) |buf| {
            return try DELResReader.init(allocator, buf);
        }
        return try DELResReader.init(allocator, &[_]u8{});
    }
    pub fn getKEYSRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!KEYSResReader {
        if (self._k_e_y_s_res_buf) |buf| {
            return try KEYSResReader.init(allocator, buf);
        }
        return try KEYSResReader.init(allocator, &[_]u8{});
    }
    pub fn getGETDELRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!GETDELResReader {
        if (self._g_e_t_d_e_l_res_buf) |buf| {
            return try GETDELResReader.init(allocator, buf);
        }
        return try GETDELResReader.init(allocator, &[_]u8{});
    }
    pub fn getGETEXRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!GETEXResReader {
        if (self._g_e_t_e_x_res_buf) |buf| {
            return try GETEXResReader.init(allocator, buf);
        }
        return try GETEXResReader.init(allocator, &[_]u8{});
    }
    pub fn getGETSETRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!GETSETResReader {
        if (self._g_e_t_s_e_t_res_buf) |buf| {
            return try GETSETResReader.init(allocator, buf);
        }
        return try GETSETResReader.init(allocator, &[_]u8{});
    }
    pub fn getINCRRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!INCRResReader {
        if (self._i_n_c_r_res_buf) |buf| {
            return try INCRResReader.init(allocator, buf);
        }
        return try INCRResReader.init(allocator, &[_]u8{});
    }
    pub fn getDECRRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!DECRResReader {
        if (self._d_e_c_r_res_buf) |buf| {
            return try DECRResReader.init(allocator, buf);
        }
        return try DECRResReader.init(allocator, &[_]u8{});
    }
    pub fn getINCRBYRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!INCRBYResReader {
        if (self._i_n_c_r_b_y_res_buf) |buf| {
            return try INCRBYResReader.init(allocator, buf);
        }
        return try INCRBYResReader.init(allocator, &[_]u8{});
    }
    pub fn getDECRBYRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!DECRBYResReader {
        if (self._d_e_c_r_b_y_res_buf) |buf| {
            return try DECRBYResReader.init(allocator, buf);
        }
        return try DECRBYResReader.init(allocator, &[_]u8{});
    }
    pub fn getFLUSHDBRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!FLUSHDBResReader {
        if (self._f_l_u_s_h_d_b_res_buf) |buf| {
            return try FLUSHDBResReader.init(allocator, buf);
        }
        return try FLUSHDBResReader.init(allocator, &[_]u8{});
    }
    pub fn getEXPIRERes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!EXPIREResReader {
        if (self._e_x_p_i_r_e_res_buf) |buf| {
            return try EXPIREResReader.init(allocator, buf);
        }
        return try EXPIREResReader.init(allocator, &[_]u8{});
    }
    pub fn getEXPIREATRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!EXPIREATResReader {
        if (self._e_x_p_i_r_e_a_t_res_buf) |buf| {
            return try EXPIREATResReader.init(allocator, buf);
        }
        return try EXPIREATResReader.init(allocator, &[_]u8{});
    }
    pub fn getEXPIRETIMERes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!EXPIRETIMEResReader {
        if (self._e_x_p_i_r_e_t_i_m_e_res_buf) |buf| {
            return try EXPIRETIMEResReader.init(allocator, buf);
        }
        return try EXPIRETIMEResReader.init(allocator, &[_]u8{});
    }
    pub fn getTTLRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!TTLResReader {
        if (self._t_t_l_res_buf) |buf| {
            return try TTLResReader.init(allocator, buf);
        }
        return try TTLResReader.init(allocator, &[_]u8{});
    }
    pub fn getGETWATCHRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!GETWATCHResReader {
        if (self._g_e_t_w_a_t_c_h_res_buf) |buf| {
            return try GETWATCHResReader.init(allocator, buf);
        }
        return try GETWATCHResReader.init(allocator, &[_]u8{});
    }
    pub fn getUNWATCHRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!UNWATCHResReader {
        if (self._u_n_w_a_t_c_h_res_buf) |buf| {
            return try UNWATCHResReader.init(allocator, buf);
        }
        return try UNWATCHResReader.init(allocator, &[_]u8{});
    }
    pub fn getHGETRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!HGETResReader {
        if (self._h_g_e_t_res_buf) |buf| {
            return try HGETResReader.init(allocator, buf);
        }
        return try HGETResReader.init(allocator, &[_]u8{});
    }
    pub fn getHSETRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!HSETResReader {
        if (self._h_s_e_t_res_buf) |buf| {
            return try HSETResReader.init(allocator, buf);
        }
        return try HSETResReader.init(allocator, &[_]u8{});
    }
    pub fn getHGETALLRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!HGETALLResReader {
        if (self._h_g_e_t_a_l_l_res_buf) |buf| {
            return try HGETALLResReader.init(allocator, buf);
        }
        return try HGETALLResReader.init(allocator, &[_]u8{});
    }
    pub fn getHGETWATCHRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!HGETWATCHResReader {
        if (self._h_g_e_t_w_a_t_c_h_res_buf) |buf| {
            return try HGETWATCHResReader.init(allocator, buf);
        }
        return try HGETWATCHResReader.init(allocator, &[_]u8{});
    }
    pub fn getHGETALLWATCHRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!HGETALLWATCHResReader {
        if (self._h_g_e_t_a_l_l_w_a_t_c_h_res_buf) |buf| {
            return try HGETALLWATCHResReader.init(allocator, buf);
        }
        return try HGETALLWATCHResReader.init(allocator, &[_]u8{});
    }
    pub fn getZADDRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZADDResReader {
        if (self._z_a_d_d_res_buf) |buf| {
            return try ZADDResReader.init(allocator, buf);
        }
        return try ZADDResReader.init(allocator, &[_]u8{});
    }
    pub fn getZCOUNTRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZCOUNTResReader {
        if (self._z_c_o_u_n_t_res_buf) |buf| {
            return try ZCOUNTResReader.init(allocator, buf);
        }
        return try ZCOUNTResReader.init(allocator, &[_]u8{});
    }
    pub fn getZRANGERes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZRANGEResReader {
        if (self._z_r_a_n_g_e_res_buf) |buf| {
            return try ZRANGEResReader.init(allocator, buf);
        }
        return try ZRANGEResReader.init(allocator, &[_]u8{});
    }
    pub fn getZPOPMAXRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZPOPMAXResReader {
        if (self._z_p_o_p_m_a_x_res_buf) |buf| {
            return try ZPOPMAXResReader.init(allocator, buf);
        }
        return try ZPOPMAXResReader.init(allocator, &[_]u8{});
    }
    pub fn getZREMRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZREMResReader {
        if (self._z_r_e_m_res_buf) |buf| {
            return try ZREMResReader.init(allocator, buf);
        }
        return try ZREMResReader.init(allocator, &[_]u8{});
    }
    pub fn getZPOPMINRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZPOPMINResReader {
        if (self._z_p_o_p_m_i_n_res_buf) |buf| {
            return try ZPOPMINResReader.init(allocator, buf);
        }
        return try ZPOPMINResReader.init(allocator, &[_]u8{});
    }
    pub fn getZRANKRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZRANKResReader {
        if (self._z_r_a_n_k_res_buf) |buf| {
            return try ZRANKResReader.init(allocator, buf);
        }
        return try ZRANKResReader.init(allocator, &[_]u8{});
    }
    pub fn getZCARDRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZCARDResReader {
        if (self._z_c_a_r_d_res_buf) |buf| {
            return try ZCARDResReader.init(allocator, buf);
        }
        return try ZCARDResReader.init(allocator, &[_]u8{});
    }
    pub fn getZRANGEWATCHRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZRANGEWATCHResReader {
        if (self._z_r_a_n_g_e_w_a_t_c_h_res_buf) |buf| {
            return try ZRANGEWATCHResReader.init(allocator, buf);
        }
        return try ZRANGEWATCHResReader.init(allocator, &[_]u8{});
    }
    pub fn getZCOUNTWATCHRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZCOUNTWATCHResReader {
        if (self._z_c_o_u_n_t_w_a_t_c_h_res_buf) |buf| {
            return try ZCOUNTWATCHResReader.init(allocator, buf);
        }
        return try ZCOUNTWATCHResReader.init(allocator, &[_]u8{});
    }
    pub fn getZCARDWATCHRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZCARDWATCHResReader {
        if (self._z_c_a_r_d_w_a_t_c_h_res_buf) |buf| {
            return try ZCARDWATCHResReader.init(allocator, buf);
        }
        return try ZCARDWATCHResReader.init(allocator, &[_]u8{});
    }
    pub fn getZRANKWATCHRes(self: *const ResultReader, allocator: std.mem.Allocator) gremlin.Error!ZRANKWATCHResReader {
        if (self._z_r_a_n_k_w_a_t_c_h_res_buf) |buf| {
            return try ZRANKWATCHResReader.init(allocator, buf);
        }
        return try ZRANKWATCHResReader.init(allocator, &[_]u8{});
    }
};

pub const ZRANKWATCHRes = struct {
    pub fn calcProtobufSize(_: *const ZRANKWATCHRes) usize {
        return 0;
    }

    pub fn encode(self: *const ZRANKWATCHRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const ZRANKWATCHRes, _: *gremlin.Writer) void {}
};

pub const ZRANKWATCHResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!ZRANKWATCHResReader {
        return ZRANKWATCHResReader{};
    }
    pub fn deinit(_: *const ZRANKWATCHResReader) void {}
};

pub const HGETWATCHRes = struct {
    pub fn calcProtobufSize(_: *const HGETWATCHRes) usize {
        return 0;
    }

    pub fn encode(self: *const HGETWATCHRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const HGETWATCHRes, _: *gremlin.Writer) void {}
};

pub const HGETWATCHResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!HGETWATCHResReader {
        return HGETWATCHResReader{};
    }
    pub fn deinit(_: *const HGETWATCHResReader) void {}
};

pub const HGETALLWATCHRes = struct {
    pub fn calcProtobufSize(_: *const HGETALLWATCHRes) usize {
        return 0;
    }

    pub fn encode(self: *const HGETALLWATCHRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const HGETALLWATCHRes, _: *gremlin.Writer) void {}
};

pub const HGETALLWATCHResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!HGETALLWATCHResReader {
        return HGETALLWATCHResReader{};
    }
    pub fn deinit(_: *const HGETALLWATCHResReader) void {}
};

pub const GETWATCHRes = struct {
    pub fn calcProtobufSize(_: *const GETWATCHRes) usize {
        return 0;
    }

    pub fn encode(self: *const GETWATCHRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const GETWATCHRes, _: *gremlin.Writer) void {}
};

pub const GETWATCHResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!GETWATCHResReader {
        return GETWATCHResReader{};
    }
    pub fn deinit(_: *const GETWATCHResReader) void {}
};

pub const UNWATCHRes = struct {
    pub fn calcProtobufSize(_: *const UNWATCHRes) usize {
        return 0;
    }

    pub fn encode(self: *const UNWATCHRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const UNWATCHRes, _: *gremlin.Writer) void {}
};

pub const UNWATCHResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!UNWATCHResReader {
        return UNWATCHResReader{};
    }
    pub fn deinit(_: *const UNWATCHResReader) void {}
};

const ZADDResWire = struct {
    const COUNT_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const ZADDRes = struct {
    // fields
    count: i64 = 0,

    pub fn calcProtobufSize(self: *const ZADDRes) usize {
        var res: usize = 0;
        if (self.count != 0) {
            res += gremlin.sizes.sizeWireNumber(ZADDResWire.COUNT_WIRE) + gremlin.sizes.sizeI64(self.count);
        }
        return res;
    }

    pub fn encode(self: *const ZADDRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZADDRes, target: *gremlin.Writer) void {
        if (self.count != 0) {
            target.appendInt64(ZADDResWire.COUNT_WIRE, self.count);
        }
    }
};

pub const ZADDResReader = struct {
    _count: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ZADDResReader {
        var buf = gremlin.Reader.init(src);
        var res = ZADDResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZADDResWire.COUNT_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._count = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ZADDResReader) void {}

    pub inline fn getCount(self: *const ZADDResReader) i64 {
        return self._count;
    }
};

const ZCOUNTResWire = struct {
    const COUNT_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const ZCOUNTRes = struct {
    // fields
    count: i64 = 0,

    pub fn calcProtobufSize(self: *const ZCOUNTRes) usize {
        var res: usize = 0;
        if (self.count != 0) {
            res += gremlin.sizes.sizeWireNumber(ZCOUNTResWire.COUNT_WIRE) + gremlin.sizes.sizeI64(self.count);
        }
        return res;
    }

    pub fn encode(self: *const ZCOUNTRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZCOUNTRes, target: *gremlin.Writer) void {
        if (self.count != 0) {
            target.appendInt64(ZCOUNTResWire.COUNT_WIRE, self.count);
        }
    }
};

pub const ZCOUNTResReader = struct {
    _count: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ZCOUNTResReader {
        var buf = gremlin.Reader.init(src);
        var res = ZCOUNTResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZCOUNTResWire.COUNT_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._count = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ZCOUNTResReader) void {}

    pub inline fn getCount(self: *const ZCOUNTResReader) i64 {
        return self._count;
    }
};

const TYPEResWire = struct {
    const TYPE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const TYPERes = struct {
    // fields
    type: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const TYPERes) usize {
        var res: usize = 0;
        if (self.type) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(TYPEResWire.TYPE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const TYPERes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const TYPERes, target: *gremlin.Writer) void {
        if (self.type) |v| {
            if (v.len > 0) {
                target.appendBytes(TYPEResWire.TYPE_WIRE, v);
            }
        }
    }
};

pub const TYPEResReader = struct {
    _type: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!TYPEResReader {
        var buf = gremlin.Reader.init(src);
        var res = TYPEResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                TYPEResWire.TYPE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._type = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const TYPEResReader) void {}

    pub inline fn getType(self: *const TYPEResReader) []const u8 {
        return self._type orelse &[_]u8{};
    }
};

const PINGResWire = struct {
    const MESSAGE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const PINGRes = struct {
    // fields
    message: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const PINGRes) usize {
        var res: usize = 0;
        if (self.message) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(PINGResWire.MESSAGE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const PINGRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const PINGRes, target: *gremlin.Writer) void {
        if (self.message) |v| {
            if (v.len > 0) {
                target.appendBytes(PINGResWire.MESSAGE_WIRE, v);
            }
        }
    }
};

pub const PINGResReader = struct {
    _message: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!PINGResReader {
        var buf = gremlin.Reader.init(src);
        var res = PINGResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                PINGResWire.MESSAGE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._message = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const PINGResReader) void {}

    pub inline fn getMessage(self: *const PINGResReader) []const u8 {
        return self._message orelse &[_]u8{};
    }
};

const HGETResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const HGETRes = struct {
    // fields
    value: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const HGETRes) usize {
        var res: usize = 0;
        if (self.value) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(HGETResWire.VALUE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const HGETRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const HGETRes, target: *gremlin.Writer) void {
        if (self.value) |v| {
            if (v.len > 0) {
                target.appendBytes(HGETResWire.VALUE_WIRE, v);
            }
        }
    }
};

pub const HGETResReader = struct {
    _value: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!HGETResReader {
        var buf = gremlin.Reader.init(src);
        var res = HGETResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                HGETResWire.VALUE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const HGETResReader) void {}

    pub inline fn getValue(self: *const HGETResReader) []const u8 {
        return self._value orelse &[_]u8{};
    }
};

const HSETResWire = struct {
    const COUNT_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const HSETRes = struct {
    // fields
    count: i64 = 0,

    pub fn calcProtobufSize(self: *const HSETRes) usize {
        var res: usize = 0;
        if (self.count != 0) {
            res += gremlin.sizes.sizeWireNumber(HSETResWire.COUNT_WIRE) + gremlin.sizes.sizeI64(self.count);
        }
        return res;
    }

    pub fn encode(self: *const HSETRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const HSETRes, target: *gremlin.Writer) void {
        if (self.count != 0) {
            target.appendInt64(HSETResWire.COUNT_WIRE, self.count);
        }
    }
};

pub const HSETResReader = struct {
    _count: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!HSETResReader {
        var buf = gremlin.Reader.init(src);
        var res = HSETResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                HSETResWire.COUNT_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._count = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const HSETResReader) void {}

    pub inline fn getCount(self: *const HSETResReader) i64 {
        return self._count;
    }
};

const HElementWire = struct {
    const KEY_WIRE: gremlin.ProtoWireNumber = 1;
    const VALUE_WIRE: gremlin.ProtoWireNumber = 2;
};

pub const HElement = struct {
    // fields
    key: ?[]const u8 = null,
    value: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const HElement) usize {
        var res: usize = 0;
        if (self.key) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(HElementWire.KEY_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        if (self.value) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(HElementWire.VALUE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const HElement, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const HElement, target: *gremlin.Writer) void {
        if (self.key) |v| {
            if (v.len > 0) {
                target.appendBytes(HElementWire.KEY_WIRE, v);
            }
        }
        if (self.value) |v| {
            if (v.len > 0) {
                target.appendBytes(HElementWire.VALUE_WIRE, v);
            }
        }
    }
};

pub const HElementReader = struct {
    _key: ?[]const u8 = null,
    _value: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!HElementReader {
        var buf = gremlin.Reader.init(src);
        var res = HElementReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                HElementWire.KEY_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._key = result.value;
                },
                HElementWire.VALUE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const HElementReader) void {}

    pub inline fn getKey(self: *const HElementReader) []const u8 {
        return self._key orelse &[_]u8{};
    }
    pub inline fn getValue(self: *const HElementReader) []const u8 {
        return self._value orelse &[_]u8{};
    }
};

const HGETALLResWire = struct {
    const ELEMENTS_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const HGETALLRes = struct {
    // fields
    elements: ?[]const ?HElement = null,

    pub fn calcProtobufSize(self: *const HGETALLRes) usize {
        var res: usize = 0;
        if (self.elements) |arr| {
            for (arr) |maybe_v| {
                res += gremlin.sizes.sizeWireNumber(HGETALLResWire.ELEMENTS_WIRE);
                if (maybe_v) |v| {
                    const size = v.calcProtobufSize();
                    res += gremlin.sizes.sizeUsize(size) + size;
                } else {
                    res += gremlin.sizes.sizeUsize(0);
                }
            }
        }
        return res;
    }

    pub fn encode(self: *const HGETALLRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const HGETALLRes, target: *gremlin.Writer) void {
        if (self.elements) |arr| {
            for (arr) |maybe_v| {
                if (maybe_v) |v| {
                    const size = v.calcProtobufSize();
                    target.appendBytesTag(HGETALLResWire.ELEMENTS_WIRE, size);
                    v.encodeTo(target);
                } else {
                    target.appendBytesTag(HGETALLResWire.ELEMENTS_WIRE, 0);
                }
            }
        }
    }
};

pub const HGETALLResReader = struct {
    allocator: std.mem.Allocator,
    buf: gremlin.Reader,
    _elements_bufs: ?std.ArrayList([]const u8) = null,

    pub fn init(allocator: std.mem.Allocator, src: []const u8) gremlin.Error!HGETALLResReader {
        var buf = gremlin.Reader.init(src);
        var res = HGETALLResReader{ .allocator = allocator, .buf = buf };
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                HGETALLResWire.ELEMENTS_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    if (res._elements_bufs == null) {
                        res._elements_bufs = std.ArrayList([]const u8).init(allocator);
                    }
                    try res._elements_bufs.?.append(result.value);
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(self: *const HGETALLResReader) void {
        if (self._elements_bufs) |arr| {
            arr.deinit();
        }
    }
    pub fn getElements(self: *const HGETALLResReader, allocator: std.mem.Allocator) gremlin.Error![]HElementReader {
        if (self._elements_bufs) |bufs| {
            var result = try std.ArrayList(HElementReader).initCapacity(allocator, bufs.items.len);
            for (bufs.items) |buf| {
                try result.append(try HElementReader.init(allocator, buf));
            }
            return result.toOwnedSlice();
        }
        return &[_]HElementReader{};
    }
};

const TTLResWire = struct {
    const SECONDS_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const TTLRes = struct {
    // fields
    seconds: i64 = 0,

    pub fn calcProtobufSize(self: *const TTLRes) usize {
        var res: usize = 0;
        if (self.seconds != 0) {
            res += gremlin.sizes.sizeWireNumber(TTLResWire.SECONDS_WIRE) + gremlin.sizes.sizeI64(self.seconds);
        }
        return res;
    }

    pub fn encode(self: *const TTLRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const TTLRes, target: *gremlin.Writer) void {
        if (self.seconds != 0) {
            target.appendInt64(TTLResWire.SECONDS_WIRE, self.seconds);
        }
    }
};

pub const TTLResReader = struct {
    _seconds: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!TTLResReader {
        var buf = gremlin.Reader.init(src);
        var res = TTLResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                TTLResWire.SECONDS_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._seconds = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const TTLResReader) void {}

    pub inline fn getSeconds(self: *const TTLResReader) i64 {
        return self._seconds;
    }
};

const EXPIREResWire = struct {
    const IS_CHANGED_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const EXPIRERes = struct {
    // fields
    is_changed: bool = false,

    pub fn calcProtobufSize(self: *const EXPIRERes) usize {
        var res: usize = 0;
        if (self.is_changed != false) {
            res += gremlin.sizes.sizeWireNumber(EXPIREResWire.IS_CHANGED_WIRE) + gremlin.sizes.sizeBool(self.is_changed);
        }
        return res;
    }

    pub fn encode(self: *const EXPIRERes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const EXPIRERes, target: *gremlin.Writer) void {
        if (self.is_changed != false) {
            target.appendBool(EXPIREResWire.IS_CHANGED_WIRE, self.is_changed);
        }
    }
};

pub const EXPIREResReader = struct {
    _is_changed: bool = false,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!EXPIREResReader {
        var buf = gremlin.Reader.init(src);
        var res = EXPIREResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                EXPIREResWire.IS_CHANGED_WIRE => {
                    const result = try buf.readBool(offset);
                    offset += result.size;
                    res._is_changed = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const EXPIREResReader) void {}

    pub inline fn getIsChanged(self: *const EXPIREResReader) bool {
        return self._is_changed;
    }
};

const EXPIREATResWire = struct {
    const IS_CHANGED_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const EXPIREATRes = struct {
    // fields
    is_changed: bool = false,

    pub fn calcProtobufSize(self: *const EXPIREATRes) usize {
        var res: usize = 0;
        if (self.is_changed != false) {
            res += gremlin.sizes.sizeWireNumber(EXPIREATResWire.IS_CHANGED_WIRE) + gremlin.sizes.sizeBool(self.is_changed);
        }
        return res;
    }

    pub fn encode(self: *const EXPIREATRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const EXPIREATRes, target: *gremlin.Writer) void {
        if (self.is_changed != false) {
            target.appendBool(EXPIREATResWire.IS_CHANGED_WIRE, self.is_changed);
        }
    }
};

pub const EXPIREATResReader = struct {
    _is_changed: bool = false,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!EXPIREATResReader {
        var buf = gremlin.Reader.init(src);
        var res = EXPIREATResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                EXPIREATResWire.IS_CHANGED_WIRE => {
                    const result = try buf.readBool(offset);
                    offset += result.size;
                    res._is_changed = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const EXPIREATResReader) void {}

    pub inline fn getIsChanged(self: *const EXPIREATResReader) bool {
        return self._is_changed;
    }
};

const EXPIRETIMEResWire = struct {
    const UNIX_SEC_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const EXPIRETIMERes = struct {
    // fields
    unix_sec: i64 = 0,

    pub fn calcProtobufSize(self: *const EXPIRETIMERes) usize {
        var res: usize = 0;
        if (self.unix_sec != 0) {
            res += gremlin.sizes.sizeWireNumber(EXPIRETIMEResWire.UNIX_SEC_WIRE) + gremlin.sizes.sizeI64(self.unix_sec);
        }
        return res;
    }

    pub fn encode(self: *const EXPIRETIMERes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const EXPIRETIMERes, target: *gremlin.Writer) void {
        if (self.unix_sec != 0) {
            target.appendInt64(EXPIRETIMEResWire.UNIX_SEC_WIRE, self.unix_sec);
        }
    }
};

pub const EXPIRETIMEResReader = struct {
    _unix_sec: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!EXPIRETIMEResReader {
        var buf = gremlin.Reader.init(src);
        var res = EXPIRETIMEResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                EXPIRETIMEResWire.UNIX_SEC_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._unix_sec = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const EXPIRETIMEResReader) void {}

    pub inline fn getUnixSec(self: *const EXPIRETIMEResReader) i64 {
        return self._unix_sec;
    }
};

const ECHOResWire = struct {
    const MESSAGE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const ECHORes = struct {
    // fields
    message: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const ECHORes) usize {
        var res: usize = 0;
        if (self.message) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(ECHOResWire.MESSAGE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const ECHORes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ECHORes, target: *gremlin.Writer) void {
        if (self.message) |v| {
            if (v.len > 0) {
                target.appendBytes(ECHOResWire.MESSAGE_WIRE, v);
            }
        }
    }
};

pub const ECHOResReader = struct {
    _message: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ECHOResReader {
        var buf = gremlin.Reader.init(src);
        var res = ECHOResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ECHOResWire.MESSAGE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._message = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ECHOResReader) void {}

    pub inline fn getMessage(self: *const ECHOResReader) []const u8 {
        return self._message orelse &[_]u8{};
    }
};

const EXISTSResWire = struct {
    const COUNT_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const EXISTSRes = struct {
    // fields
    count: i64 = 0,

    pub fn calcProtobufSize(self: *const EXISTSRes) usize {
        var res: usize = 0;
        if (self.count != 0) {
            res += gremlin.sizes.sizeWireNumber(EXISTSResWire.COUNT_WIRE) + gremlin.sizes.sizeI64(self.count);
        }
        return res;
    }

    pub fn encode(self: *const EXISTSRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const EXISTSRes, target: *gremlin.Writer) void {
        if (self.count != 0) {
            target.appendInt64(EXISTSResWire.COUNT_WIRE, self.count);
        }
    }
};

pub const EXISTSResReader = struct {
    _count: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!EXISTSResReader {
        var buf = gremlin.Reader.init(src);
        var res = EXISTSResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                EXISTSResWire.COUNT_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._count = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const EXISTSResReader) void {}

    pub inline fn getCount(self: *const EXISTSResReader) i64 {
        return self._count;
    }
};

pub const HANDSHAKERes = struct {
    pub fn calcProtobufSize(_: *const HANDSHAKERes) usize {
        return 0;
    }

    pub fn encode(self: *const HANDSHAKERes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const HANDSHAKERes, _: *gremlin.Writer) void {}
};

pub const HANDSHAKEResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!HANDSHAKEResReader {
        return HANDSHAKEResReader{};
    }
    pub fn deinit(_: *const HANDSHAKEResReader) void {}
};

const GETResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const GETRes = struct {
    // fields
    value: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const GETRes) usize {
        var res: usize = 0;
        if (self.value) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(GETResWire.VALUE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const GETRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const GETRes, target: *gremlin.Writer) void {
        if (self.value) |v| {
            if (v.len > 0) {
                target.appendBytes(GETResWire.VALUE_WIRE, v);
            }
        }
    }
};

pub const GETResReader = struct {
    _value: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!GETResReader {
        var buf = gremlin.Reader.init(src);
        var res = GETResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                GETResWire.VALUE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const GETResReader) void {}

    pub inline fn getValue(self: *const GETResReader) []const u8 {
        return self._value orelse &[_]u8{};
    }
};

const GETEXResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const GETEXRes = struct {
    // fields
    value: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const GETEXRes) usize {
        var res: usize = 0;
        if (self.value) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(GETEXResWire.VALUE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const GETEXRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const GETEXRes, target: *gremlin.Writer) void {
        if (self.value) |v| {
            if (v.len > 0) {
                target.appendBytes(GETEXResWire.VALUE_WIRE, v);
            }
        }
    }
};

pub const GETEXResReader = struct {
    _value: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!GETEXResReader {
        var buf = gremlin.Reader.init(src);
        var res = GETEXResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                GETEXResWire.VALUE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const GETEXResReader) void {}

    pub inline fn getValue(self: *const GETEXResReader) []const u8 {
        return self._value orelse &[_]u8{};
    }
};

const GETSETResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const GETSETRes = struct {
    // fields
    value: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const GETSETRes) usize {
        var res: usize = 0;
        if (self.value) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(GETSETResWire.VALUE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const GETSETRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const GETSETRes, target: *gremlin.Writer) void {
        if (self.value) |v| {
            if (v.len > 0) {
                target.appendBytes(GETSETResWire.VALUE_WIRE, v);
            }
        }
    }
};

pub const GETSETResReader = struct {
    _value: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!GETSETResReader {
        var buf = gremlin.Reader.init(src);
        var res = GETSETResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                GETSETResWire.VALUE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const GETSETResReader) void {}

    pub inline fn getValue(self: *const GETSETResReader) []const u8 {
        return self._value orelse &[_]u8{};
    }
};

const GETDELResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const GETDELRes = struct {
    // fields
    value: ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const GETDELRes) usize {
        var res: usize = 0;
        if (self.value) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(GETDELResWire.VALUE_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        return res;
    }

    pub fn encode(self: *const GETDELRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const GETDELRes, target: *gremlin.Writer) void {
        if (self.value) |v| {
            if (v.len > 0) {
                target.appendBytes(GETDELResWire.VALUE_WIRE, v);
            }
        }
    }
};

pub const GETDELResReader = struct {
    _value: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!GETDELResReader {
        var buf = gremlin.Reader.init(src);
        var res = GETDELResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                GETDELResWire.VALUE_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const GETDELResReader) void {}

    pub inline fn getValue(self: *const GETDELResReader) []const u8 {
        return self._value orelse &[_]u8{};
    }
};

pub const SETRes = struct {
    pub fn calcProtobufSize(_: *const SETRes) usize {
        return 0;
    }

    pub fn encode(self: *const SETRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const SETRes, _: *gremlin.Writer) void {}
};

pub const SETResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!SETResReader {
        return SETResReader{};
    }
    pub fn deinit(_: *const SETResReader) void {}
};

const DELResWire = struct {
    const COUNT_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const DELRes = struct {
    // fields
    count: i64 = 0,

    pub fn calcProtobufSize(self: *const DELRes) usize {
        var res: usize = 0;
        if (self.count != 0) {
            res += gremlin.sizes.sizeWireNumber(DELResWire.COUNT_WIRE) + gremlin.sizes.sizeI64(self.count);
        }
        return res;
    }

    pub fn encode(self: *const DELRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const DELRes, target: *gremlin.Writer) void {
        if (self.count != 0) {
            target.appendInt64(DELResWire.COUNT_WIRE, self.count);
        }
    }
};

pub const DELResReader = struct {
    _count: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!DELResReader {
        var buf = gremlin.Reader.init(src);
        var res = DELResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                DELResWire.COUNT_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._count = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const DELResReader) void {}

    pub inline fn getCount(self: *const DELResReader) i64 {
        return self._count;
    }
};

pub const FLUSHDBRes = struct {
    pub fn calcProtobufSize(_: *const FLUSHDBRes) usize {
        return 0;
    }

    pub fn encode(self: *const FLUSHDBRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const FLUSHDBRes, _: *gremlin.Writer) void {}
};

pub const FLUSHDBResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!FLUSHDBResReader {
        return FLUSHDBResReader{};
    }
    pub fn deinit(_: *const FLUSHDBResReader) void {}
};

const KEYSResWire = struct {
    const KEYS_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const KEYSRes = struct {
    // fields
    keys: ?[]const ?[]const u8 = null,

    pub fn calcProtobufSize(self: *const KEYSRes) usize {
        var res: usize = 0;
        if (self.keys) |arr| {
            for (arr) |maybe_v| {
                res += gremlin.sizes.sizeWireNumber(KEYSResWire.KEYS_WIRE);
                if (maybe_v) |v| {
                    res += gremlin.sizes.sizeUsize(v.len) + v.len;
                } else {
                    res += gremlin.sizes.sizeUsize(0);
                }
            }
        }
        return res;
    }

    pub fn encode(self: *const KEYSRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const KEYSRes, target: *gremlin.Writer) void {
        if (self.keys) |arr| {
            for (arr) |maybe_v| {
                if (maybe_v) |v| {
                    target.appendBytes(KEYSResWire.KEYS_WIRE, v);
                } else {
                    target.appendBytesTag(KEYSResWire.KEYS_WIRE, 0);
                }
            }
        }
    }
};

pub const KEYSResReader = struct {
    allocator: std.mem.Allocator,
    buf: gremlin.Reader,
    _keys: ?std.ArrayList([]const u8) = null,

    pub fn init(allocator: std.mem.Allocator, src: []const u8) gremlin.Error!KEYSResReader {
        var buf = gremlin.Reader.init(src);
        var res = KEYSResReader{ .allocator = allocator, .buf = buf };
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                KEYSResWire.KEYS_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    if (res._keys == null) {
                        res._keys = std.ArrayList([]const u8).init(allocator);
                    }
                    try res._keys.?.append(result.value);
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(self: *const KEYSResReader) void {
        if (self._keys) |arr| {
            arr.deinit();
        }
    }
    pub fn getKeys(self: *const KEYSResReader) []const []const u8 {
        if (self._keys) |arr| {
            return arr.items;
        }
        return &[_][]u8{};
    }
};

const INCRResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const INCRRes = struct {
    // fields
    value: i64 = 0,

    pub fn calcProtobufSize(self: *const INCRRes) usize {
        var res: usize = 0;
        if (self.value != 0) {
            res += gremlin.sizes.sizeWireNumber(INCRResWire.VALUE_WIRE) + gremlin.sizes.sizeI64(self.value);
        }
        return res;
    }

    pub fn encode(self: *const INCRRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const INCRRes, target: *gremlin.Writer) void {
        if (self.value != 0) {
            target.appendInt64(INCRResWire.VALUE_WIRE, self.value);
        }
    }
};

pub const INCRResReader = struct {
    _value: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!INCRResReader {
        var buf = gremlin.Reader.init(src);
        var res = INCRResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                INCRResWire.VALUE_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const INCRResReader) void {}

    pub inline fn getValue(self: *const INCRResReader) i64 {
        return self._value;
    }
};

const DECRResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const DECRRes = struct {
    // fields
    value: i64 = 0,

    pub fn calcProtobufSize(self: *const DECRRes) usize {
        var res: usize = 0;
        if (self.value != 0) {
            res += gremlin.sizes.sizeWireNumber(DECRResWire.VALUE_WIRE) + gremlin.sizes.sizeI64(self.value);
        }
        return res;
    }

    pub fn encode(self: *const DECRRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const DECRRes, target: *gremlin.Writer) void {
        if (self.value != 0) {
            target.appendInt64(DECRResWire.VALUE_WIRE, self.value);
        }
    }
};

pub const DECRResReader = struct {
    _value: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!DECRResReader {
        var buf = gremlin.Reader.init(src);
        var res = DECRResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                DECRResWire.VALUE_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const DECRResReader) void {}

    pub inline fn getValue(self: *const DECRResReader) i64 {
        return self._value;
    }
};

const INCRBYResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const INCRBYRes = struct {
    // fields
    value: i64 = 0,

    pub fn calcProtobufSize(self: *const INCRBYRes) usize {
        var res: usize = 0;
        if (self.value != 0) {
            res += gremlin.sizes.sizeWireNumber(INCRBYResWire.VALUE_WIRE) + gremlin.sizes.sizeI64(self.value);
        }
        return res;
    }

    pub fn encode(self: *const INCRBYRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const INCRBYRes, target: *gremlin.Writer) void {
        if (self.value != 0) {
            target.appendInt64(INCRBYResWire.VALUE_WIRE, self.value);
        }
    }
};

pub const INCRBYResReader = struct {
    _value: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!INCRBYResReader {
        var buf = gremlin.Reader.init(src);
        var res = INCRBYResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                INCRBYResWire.VALUE_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const INCRBYResReader) void {}

    pub inline fn getValue(self: *const INCRBYResReader) i64 {
        return self._value;
    }
};

const DECRBYResWire = struct {
    const VALUE_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const DECRBYRes = struct {
    // fields
    value: i64 = 0,

    pub fn calcProtobufSize(self: *const DECRBYRes) usize {
        var res: usize = 0;
        if (self.value != 0) {
            res += gremlin.sizes.sizeWireNumber(DECRBYResWire.VALUE_WIRE) + gremlin.sizes.sizeI64(self.value);
        }
        return res;
    }

    pub fn encode(self: *const DECRBYRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const DECRBYRes, target: *gremlin.Writer) void {
        if (self.value != 0) {
            target.appendInt64(DECRBYResWire.VALUE_WIRE, self.value);
        }
    }
};

pub const DECRBYResReader = struct {
    _value: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!DECRBYResReader {
        var buf = gremlin.Reader.init(src);
        var res = DECRBYResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                DECRBYResWire.VALUE_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._value = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const DECRBYResReader) void {}

    pub inline fn getValue(self: *const DECRBYResReader) i64 {
        return self._value;
    }
};

const ZElementWire = struct {
    const SCORE_WIRE: gremlin.ProtoWireNumber = 1;
    const MEMBER_WIRE: gremlin.ProtoWireNumber = 2;
    const RANK_WIRE: gremlin.ProtoWireNumber = 3;
};

pub const ZElement = struct {
    // fields
    score: i64 = 0,
    member: ?[]const u8 = null,
    rank: i64 = 0,

    pub fn calcProtobufSize(self: *const ZElement) usize {
        var res: usize = 0;
        if (self.score != 0) {
            res += gremlin.sizes.sizeWireNumber(ZElementWire.SCORE_WIRE) + gremlin.sizes.sizeI64(self.score);
        }
        if (self.member) |v| {
            if (v.len > 0) {
                res += gremlin.sizes.sizeWireNumber(ZElementWire.MEMBER_WIRE) + gremlin.sizes.sizeUsize(v.len) + v.len;
            }
        }
        if (self.rank != 0) {
            res += gremlin.sizes.sizeWireNumber(ZElementWire.RANK_WIRE) + gremlin.sizes.sizeI64(self.rank);
        }
        return res;
    }

    pub fn encode(self: *const ZElement, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZElement, target: *gremlin.Writer) void {
        if (self.score != 0) {
            target.appendInt64(ZElementWire.SCORE_WIRE, self.score);
        }
        if (self.member) |v| {
            if (v.len > 0) {
                target.appendBytes(ZElementWire.MEMBER_WIRE, v);
            }
        }
        if (self.rank != 0) {
            target.appendInt64(ZElementWire.RANK_WIRE, self.rank);
        }
    }
};

pub const ZElementReader = struct {
    _score: i64 = 0,
    _member: ?[]const u8 = null,
    _rank: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ZElementReader {
        var buf = gremlin.Reader.init(src);
        var res = ZElementReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZElementWire.SCORE_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._score = result.value;
                },
                ZElementWire.MEMBER_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._member = result.value;
                },
                ZElementWire.RANK_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._rank = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ZElementReader) void {}

    pub inline fn getScore(self: *const ZElementReader) i64 {
        return self._score;
    }
    pub inline fn getMember(self: *const ZElementReader) []const u8 {
        return self._member orelse &[_]u8{};
    }
    pub inline fn getRank(self: *const ZElementReader) i64 {
        return self._rank;
    }
};

const ZRANGEResWire = struct {
    const ELEMENTS_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const ZRANGERes = struct {
    // fields
    elements: ?[]const ?ZElement = null,

    pub fn calcProtobufSize(self: *const ZRANGERes) usize {
        var res: usize = 0;
        if (self.elements) |arr| {
            for (arr) |maybe_v| {
                res += gremlin.sizes.sizeWireNumber(ZRANGEResWire.ELEMENTS_WIRE);
                if (maybe_v) |v| {
                    const size = v.calcProtobufSize();
                    res += gremlin.sizes.sizeUsize(size) + size;
                } else {
                    res += gremlin.sizes.sizeUsize(0);
                }
            }
        }
        return res;
    }

    pub fn encode(self: *const ZRANGERes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZRANGERes, target: *gremlin.Writer) void {
        if (self.elements) |arr| {
            for (arr) |maybe_v| {
                if (maybe_v) |v| {
                    const size = v.calcProtobufSize();
                    target.appendBytesTag(ZRANGEResWire.ELEMENTS_WIRE, size);
                    v.encodeTo(target);
                } else {
                    target.appendBytesTag(ZRANGEResWire.ELEMENTS_WIRE, 0);
                }
            }
        }
    }
};

pub const ZRANGEResReader = struct {
    allocator: std.mem.Allocator,
    buf: gremlin.Reader,
    _elements_bufs: ?std.ArrayList([]const u8) = null,

    pub fn init(allocator: std.mem.Allocator, src: []const u8) gremlin.Error!ZRANGEResReader {
        var buf = gremlin.Reader.init(src);
        var res = ZRANGEResReader{ .allocator = allocator, .buf = buf };
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZRANGEResWire.ELEMENTS_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    if (res._elements_bufs == null) {
                        res._elements_bufs = std.ArrayList([]const u8).init(allocator);
                    }
                    try res._elements_bufs.?.append(result.value);
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(self: *const ZRANGEResReader) void {
        if (self._elements_bufs) |arr| {
            arr.deinit();
        }
    }
    pub fn getElements(self: *const ZRANGEResReader, allocator: std.mem.Allocator) gremlin.Error![]ZElementReader {
        if (self._elements_bufs) |bufs| {
            var result = try std.ArrayList(ZElementReader).initCapacity(allocator, bufs.items.len);
            for (bufs.items) |buf| {
                try result.append(try ZElementReader.init(allocator, buf));
            }
            return result.toOwnedSlice();
        }
        return &[_]ZElementReader{};
    }
};

const ZPOPMAXResWire = struct {
    const ELEMENTS_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const ZPOPMAXRes = struct {
    // fields
    elements: ?[]const ?ZElement = null,

    pub fn calcProtobufSize(self: *const ZPOPMAXRes) usize {
        var res: usize = 0;
        if (self.elements) |arr| {
            for (arr) |maybe_v| {
                res += gremlin.sizes.sizeWireNumber(ZPOPMAXResWire.ELEMENTS_WIRE);
                if (maybe_v) |v| {
                    const size = v.calcProtobufSize();
                    res += gremlin.sizes.sizeUsize(size) + size;
                } else {
                    res += gremlin.sizes.sizeUsize(0);
                }
            }
        }
        return res;
    }

    pub fn encode(self: *const ZPOPMAXRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZPOPMAXRes, target: *gremlin.Writer) void {
        if (self.elements) |arr| {
            for (arr) |maybe_v| {
                if (maybe_v) |v| {
                    const size = v.calcProtobufSize();
                    target.appendBytesTag(ZPOPMAXResWire.ELEMENTS_WIRE, size);
                    v.encodeTo(target);
                } else {
                    target.appendBytesTag(ZPOPMAXResWire.ELEMENTS_WIRE, 0);
                }
            }
        }
    }
};

pub const ZPOPMAXResReader = struct {
    allocator: std.mem.Allocator,
    buf: gremlin.Reader,
    _elements_bufs: ?std.ArrayList([]const u8) = null,

    pub fn init(allocator: std.mem.Allocator, src: []const u8) gremlin.Error!ZPOPMAXResReader {
        var buf = gremlin.Reader.init(src);
        var res = ZPOPMAXResReader{ .allocator = allocator, .buf = buf };
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZPOPMAXResWire.ELEMENTS_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    if (res._elements_bufs == null) {
                        res._elements_bufs = std.ArrayList([]const u8).init(allocator);
                    }
                    try res._elements_bufs.?.append(result.value);
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(self: *const ZPOPMAXResReader) void {
        if (self._elements_bufs) |arr| {
            arr.deinit();
        }
    }
    pub fn getElements(self: *const ZPOPMAXResReader, allocator: std.mem.Allocator) gremlin.Error![]ZElementReader {
        if (self._elements_bufs) |bufs| {
            var result = try std.ArrayList(ZElementReader).initCapacity(allocator, bufs.items.len);
            for (bufs.items) |buf| {
                try result.append(try ZElementReader.init(allocator, buf));
            }
            return result.toOwnedSlice();
        }
        return &[_]ZElementReader{};
    }
};

const ZREMResWire = struct {
    const COUNT_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const ZREMRes = struct {
    // fields
    count: i64 = 0,

    pub fn calcProtobufSize(self: *const ZREMRes) usize {
        var res: usize = 0;
        if (self.count != 0) {
            res += gremlin.sizes.sizeWireNumber(ZREMResWire.COUNT_WIRE) + gremlin.sizes.sizeI64(self.count);
        }
        return res;
    }

    pub fn encode(self: *const ZREMRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZREMRes, target: *gremlin.Writer) void {
        if (self.count != 0) {
            target.appendInt64(ZREMResWire.COUNT_WIRE, self.count);
        }
    }
};

pub const ZREMResReader = struct {
    _count: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ZREMResReader {
        var buf = gremlin.Reader.init(src);
        var res = ZREMResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZREMResWire.COUNT_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._count = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ZREMResReader) void {}

    pub inline fn getCount(self: *const ZREMResReader) i64 {
        return self._count;
    }
};

const ZPOPMINResWire = struct {
    const ELEMENTS_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const ZPOPMINRes = struct {
    // fields
    elements: ?[]const ?ZElement = null,

    pub fn calcProtobufSize(self: *const ZPOPMINRes) usize {
        var res: usize = 0;
        if (self.elements) |arr| {
            for (arr) |maybe_v| {
                res += gremlin.sizes.sizeWireNumber(ZPOPMINResWire.ELEMENTS_WIRE);
                if (maybe_v) |v| {
                    const size = v.calcProtobufSize();
                    res += gremlin.sizes.sizeUsize(size) + size;
                } else {
                    res += gremlin.sizes.sizeUsize(0);
                }
            }
        }
        return res;
    }

    pub fn encode(self: *const ZPOPMINRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZPOPMINRes, target: *gremlin.Writer) void {
        if (self.elements) |arr| {
            for (arr) |maybe_v| {
                if (maybe_v) |v| {
                    const size = v.calcProtobufSize();
                    target.appendBytesTag(ZPOPMINResWire.ELEMENTS_WIRE, size);
                    v.encodeTo(target);
                } else {
                    target.appendBytesTag(ZPOPMINResWire.ELEMENTS_WIRE, 0);
                }
            }
        }
    }
};

pub const ZPOPMINResReader = struct {
    allocator: std.mem.Allocator,
    buf: gremlin.Reader,
    _elements_bufs: ?std.ArrayList([]const u8) = null,

    pub fn init(allocator: std.mem.Allocator, src: []const u8) gremlin.Error!ZPOPMINResReader {
        var buf = gremlin.Reader.init(src);
        var res = ZPOPMINResReader{ .allocator = allocator, .buf = buf };
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZPOPMINResWire.ELEMENTS_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    if (res._elements_bufs == null) {
                        res._elements_bufs = std.ArrayList([]const u8).init(allocator);
                    }
                    try res._elements_bufs.?.append(result.value);
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(self: *const ZPOPMINResReader) void {
        if (self._elements_bufs) |arr| {
            arr.deinit();
        }
    }
    pub fn getElements(self: *const ZPOPMINResReader, allocator: std.mem.Allocator) gremlin.Error![]ZElementReader {
        if (self._elements_bufs) |bufs| {
            var result = try std.ArrayList(ZElementReader).initCapacity(allocator, bufs.items.len);
            for (bufs.items) |buf| {
                try result.append(try ZElementReader.init(allocator, buf));
            }
            return result.toOwnedSlice();
        }
        return &[_]ZElementReader{};
    }
};

const ZRANKResWire = struct {
    const ELEMENT_WIRE: gremlin.ProtoWireNumber = 2;
};

pub const ZRANKRes = struct {
    // fields
    element: ?ZElement = null,

    pub fn calcProtobufSize(self: *const ZRANKRes) usize {
        var res: usize = 0;
        if (self.element) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                res += gremlin.sizes.sizeWireNumber(ZRANKResWire.ELEMENT_WIRE) + gremlin.sizes.sizeUsize(size) + size;
            }
        }
        return res;
    }

    pub fn encode(self: *const ZRANKRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZRANKRes, target: *gremlin.Writer) void {
        if (self.element) |v| {
            const size = v.calcProtobufSize();
            if (size > 0) {
                target.appendBytesTag(ZRANKResWire.ELEMENT_WIRE, size);
                v.encodeTo(target);
            }
        }
    }
};

pub const ZRANKResReader = struct {
    _element_buf: ?[]const u8 = null,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ZRANKResReader {
        var buf = gremlin.Reader.init(src);
        var res = ZRANKResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZRANKResWire.ELEMENT_WIRE => {
                    const result = try buf.readBytes(offset);
                    offset += result.size;
                    res._element_buf = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ZRANKResReader) void {}

    pub fn getElement(self: *const ZRANKResReader, allocator: std.mem.Allocator) gremlin.Error!ZElementReader {
        if (self._element_buf) |buf| {
            return try ZElementReader.init(allocator, buf);
        }
        return try ZElementReader.init(allocator, &[_]u8{});
    }
};

const ZCARDResWire = struct {
    const COUNT_WIRE: gremlin.ProtoWireNumber = 1;
};

pub const ZCARDRes = struct {
    // fields
    count: i64 = 0,

    pub fn calcProtobufSize(self: *const ZCARDRes) usize {
        var res: usize = 0;
        if (self.count != 0) {
            res += gremlin.sizes.sizeWireNumber(ZCARDResWire.COUNT_WIRE) + gremlin.sizes.sizeI64(self.count);
        }
        return res;
    }

    pub fn encode(self: *const ZCARDRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(self: *const ZCARDRes, target: *gremlin.Writer) void {
        if (self.count != 0) {
            target.appendInt64(ZCARDResWire.COUNT_WIRE, self.count);
        }
    }
};

pub const ZCARDResReader = struct {
    _count: i64 = 0,

    pub fn init(_: std.mem.Allocator, src: []const u8) gremlin.Error!ZCARDResReader {
        var buf = gremlin.Reader.init(src);
        var res = ZCARDResReader{};
        if (buf.buf.len == 0) {
            return res;
        }
        var offset: usize = 0;
        while (buf.hasNext(offset, 0)) {
            const tag = try buf.readTagAt(offset);
            offset += tag.size;
            switch (tag.number) {
                ZCARDResWire.COUNT_WIRE => {
                    const result = try buf.readInt64(offset);
                    offset += result.size;
                    res._count = result.value;
                },
                else => {
                    offset = try buf.skipData(offset, tag.wire);
                },
            }
        }
        return res;
    }
    pub fn deinit(_: *const ZCARDResReader) void {}

    pub inline fn getCount(self: *const ZCARDResReader) i64 {
        return self._count;
    }
};

pub const ZRANGEWATCHRes = struct {
    pub fn calcProtobufSize(_: *const ZRANGEWATCHRes) usize {
        return 0;
    }

    pub fn encode(self: *const ZRANGEWATCHRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const ZRANGEWATCHRes, _: *gremlin.Writer) void {}
};

pub const ZRANGEWATCHResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!ZRANGEWATCHResReader {
        return ZRANGEWATCHResReader{};
    }
    pub fn deinit(_: *const ZRANGEWATCHResReader) void {}
};

pub const ZCOUNTWATCHRes = struct {
    pub fn calcProtobufSize(_: *const ZCOUNTWATCHRes) usize {
        return 0;
    }

    pub fn encode(self: *const ZCOUNTWATCHRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const ZCOUNTWATCHRes, _: *gremlin.Writer) void {}
};

pub const ZCOUNTWATCHResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!ZCOUNTWATCHResReader {
        return ZCOUNTWATCHResReader{};
    }
    pub fn deinit(_: *const ZCOUNTWATCHResReader) void {}
};

pub const ZCARDWATCHRes = struct {
    pub fn calcProtobufSize(_: *const ZCARDWATCHRes) usize {
        return 0;
    }

    pub fn encode(self: *const ZCARDWATCHRes, allocator: std.mem.Allocator) gremlin.Error![]const u8 {
        const size = self.calcProtobufSize();
        if (size == 0) {
            return &[_]u8{};
        }
        const buf = try allocator.alloc(u8, self.calcProtobufSize());
        var writer = gremlin.Writer.init(buf);
        self.encodeTo(&writer);
        return buf;
    }

    pub fn encodeTo(_: *const ZCARDWATCHRes, _: *gremlin.Writer) void {}
};

pub const ZCARDWATCHResReader = struct {
    pub fn init(_: std.mem.Allocator, _: []const u8) gremlin.Error!ZCARDWATCHResReader {
        return ZCARDWATCHResReader{};
    }
    pub fn deinit(_: *const ZCARDWATCHResReader) void {}
};
