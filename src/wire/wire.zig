pub const cmd = @import("./cmd.proto.zig");
pub const res = @import("./res.proto.zig");

pub const WireError = error{ UnknownError, NotEstablished, Empty, Terminated, Terminated_ClosedPipe, Terminated_BrokenPipe, Terminated_MaxRetriesReached,

    //CorruptMessage
    CorruptMessage_MessageTooLarge, CorruptMessage_InvalidMessageSize, OutOfMemory };
