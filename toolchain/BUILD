load(":cc_toolchain_config.bzl", "cc_toolchain_config")

package(default_visibility = ["//visibility:public"])

#filegroup(name = "clang_suite")

cc_toolchain_suite(
    name = "riscv64_suite",
    toolchains = {
        "riscv64": ":riscv64_toolchain",
    },
)

filegroup(name = "empty")

cc_toolchain(
    name = "riscv64_toolchain",
    toolchain_identifier = "riscv64-toolchain",
    toolchain_config = ":riscv64_toolchain_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)

#filegroup(name = "k8_toolchain_config")

cc_toolchain_config(name = "riscv64_toolchain_config")
