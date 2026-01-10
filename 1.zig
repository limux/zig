const std = @import("std");

pub fn main() void {
    const name = [_]u8{'P', 'e', 'd', 'r', 'o'};
    for (name)|char| {
        std.debug.print("{d} | ", .{char}); 
    }
}
