const std = @import("std");

// C 导入必须放在单独的块中
const c = @cImport({
    @cInclude("raylib.h");
});

pub fn main() void {
    std.debug.print("Starting Raylib with Zig...\n", .{});
    
    // 初始化窗口
    c.InitWindow(800, 600, "Zig + Raylib");
    defer c.CloseWindow();
    
    c.SetTargetFPS(60);
    
    while (!c.WindowShouldClose()) {
        c.BeginDrawing();
        defer c.EndDrawing();
        
        c.ClearBackground(c.RAYWHITE);
        c.DrawText("Hello from Zig!", 190, 200, 20, c.LIGHTGRAY);
    }
}
