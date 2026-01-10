const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "hello",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    const run_cmd = b.addRunArtifact(exe);
    const run_step = b.step("run", "运行编译好的程序");

    run_step.dependOn(&run_cmd.step);

    b.installArtifact(exe);
}
