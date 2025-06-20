const std = @import("std");
const ProtoGenStep = @import("gremlin").ProtoGenStep;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    // import libraries
    const zig_uuidv4 = b.dependency("zig_uuidv4", .{
        .target = target,
        .optimize = optimize,
    });

    const gremlin_dep = b.dependency("gremlin", .{
        .target = target,
        .optimize = optimize,
    });

    const lib_mod = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe_mod.addImport("dizeDB_lib", lib_mod);

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "dizeDB",
        .root_module = lib_mod,
    });

    lib.root_module.addImport("uuid", zig_uuidv4.module("zig_uuid_v4"));

    lib.root_module.addImport("gremlin", gremlin_dep.module("gremlin"));

    b.installArtifact(lib);

    const gen_proto = b.step("gen-proto", "generates zig files from protocol buffer definitions");

    const protoc_step = ProtoGenStep.create(
        b,
        .{
            .proto_sources = b.path("protos"), // Directory containing .proto files
            .target = b.path("src/wire"), // Output directory for generated Zig code
        },
    );

    gen_proto.dependOn(&protoc_step.step);

    const lib_unit_tests = b.addTest(.{
        .root_module = lib_mod,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const exe_unit_tests = b.addTest(.{
        .root_module = exe_mod,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
    test_step.dependOn(&run_exe_unit_tests.step);
}
