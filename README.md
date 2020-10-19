# Linux syscalls tests

The tests defined:

-   **syscalls**: system call tests run locally, and do not require
    additional configuration in the machine.
-   **util:** utilities library to support the tests.

**Configure**

Please prepare a RiscV cross-compilation toolchain.<br>
eg: [riscv-gnu-toolchain with Linux multilib](https://github.com/riscv/riscv-gnu-toolchain#installation-linux-multilib)

Configure file `toolchain/cc_toolchain_config.bzl`, and set `riscv_gnu_toolchain_path = "/path/to/your/toolchain"`.

**Build tests**

To build a single test case:<br>
`bazel build --config=riscv64_config //test/syscalls/linux:write_test`

To build all syscalls test cases:<br>
`bazel build --config=riscv64_config //test/syscalls/linux/...`

**Run tests**

Depend on library: libstdc++.so

