# DizeDB

**DizeDB** is a Zig SDK for [Dicedb](https://dicedb.io), providing a fast, type-safe, and idiomatic interface for interacting with Dicedb from Zig projects.

## Features

- Native Zig API for Dicedb
- Type-safe protocol buffer wire support
- Easy integration with Zig build system
- Example usage included

## Getting Started

### 1. Add DizeDB as a Dependency

Fetch the library using Zig's package manager:

```sh
zig fetch --save git+https://github.com/patrickowor/DizeDB.git#main
```

### 2. Update your `build.zig`

Add the following to your `build.zig` to include DizeDB as a dependency:

```zig
const diceDb = b.dependency("dizeDB", .{
    .target = target,
    .optimize = optimize,
});

exe.root_module.addImport("dizeDB", diceDb.module("dizeDB"));
```

**Example:**

```zig
const exe = b.addExecutable(.{
    .name = "your_app",
    .root_source_file = b.path("src/main.zig"),
    .target = target,
    .optimize = optimize,
});

const diceDb = b.dependency("dizeDB", .{
    .target = target,
    .optimize = optimize,
});

exe.root_module.addImport("dizeDB", diceDb.module("dizeDB"));
```

### 3. Use DizeDB in Your Code

In your Zig source file:

```zig
const dizeDB = @import("dizeDB");
// ... use dizeDB API
```

### 4. Build and Run

```sh
zig build run
```

## Example

See [`examples/src/main.zig`](examples/src/main.zig) for a working example.

## License

This project is licensed under the terms of the [LICENSE](LICENSE) file. 