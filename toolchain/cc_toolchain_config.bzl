# NEW
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
# NEW
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)

riscv_gnu_toolchain_path = "/opt/riscv/linux-elf_glibc"

all_link_actions = [ # NEW
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = riscv_gnu_toolchain_path + "/bin/riscv64-unknown-linux-gnu-gcc",
        ),
        tool_path(
            name = "ld",
            path = riscv_gnu_toolchain_path + "/bin/riscv64-unknown-linux-gnu-ld",
        ),
        tool_path(
            name = "ar",
            path = riscv_gnu_toolchain_path + "/bin/riscv64-unknown-linux-gnu-ar",
        ),
        tool_path(
            name = "cpp",
            path = riscv_gnu_toolchain_path + "/bin/riscv64-unknown-linux-gnu-cpp",
        ),
        tool_path(
            name = "gcov",
            path = riscv_gnu_toolchain_path + "/bin/riscv64-unknown-linux-gnu-gcov",
        ),
        tool_path(
            name = "nm",
            path = riscv_gnu_toolchain_path + "/bin/riscv64-unknown-linux-gnu-nm",
        ),
        tool_path(
            name = "objdump",
            path = riscv_gnu_toolchain_path + "/bin/riscv64-unknown-linux-gnu-objdump",
        ),
        tool_path(
            name = "strip",
            path = riscv_gnu_toolchain_path + "/bin/riscv64-unknown-linux-gnu-strip",
        ),
    ]

    features = [ # NEW
        feature(
            name = "default_linker_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = all_link_actions,
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "-lm",
                                "-lstdc++",
                            ],
                        ),
                    ]),
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features, # NEW
        cxx_builtin_include_directories = [
	    riscv_gnu_toolchain_path + "/riscv64-unknown-linux-gnu/include/c++/9.2.0/",
	    riscv_gnu_toolchain_path + "/lib/gcc/riscv64-unknown-linux-gnu/9.2.0/include/",
	    riscv_gnu_toolchain_path + "/lib/gcc/riscv64-unknown-linux-gnu/9.2.0/include-fixed/",
	    riscv_gnu_toolchain_path + "/sysroot/usr/include/",
        ],
        toolchain_identifier = "local",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "riscv64",
        target_libc = "unknown",
        compiler = "riscv64-compiler",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
