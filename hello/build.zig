const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "hello",
        .root_module = b.createModule(.{
            .target = b.standardTargetOptions(.{}),
            .optimize = b.standardOptimizeOption(.{}),
            .root_source_file = b.path("src/main.zig"),
        }),
    });

    // 一行添加 run 命令
    const run_step = b.step("run", "运行程序");
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    run_step.dependOn(&run_cmd.step);

    // 一行添加 help 命令
    b.step("help", "显示帮助信息").dependOn(&b.addSystemCommand(&.{
        "echo",
        \\用法:
        \\  zig build run     - 运行程序
        \\  zig build help    - 显示此帮助
        \\  zig build         - 构建程序
        \\  zig build install - 安装到 zig-out/bin
    }).step);

    b.installArtifact(exe);
}
