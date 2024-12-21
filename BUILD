load("@rules_python//python:defs.bzl", "py_binary")
load("@rules_python//python:pip.bzl", "compile_pip_requirements")

compile_pip_requirements(
    name = "requirements",
    requirements_in = "requirements.in",
    requirements_txt = "requirements.txt",
)

py_binary(
    name = "main",
    srcs = [
        "main.py",
    ],
    deps = [
        "@pip//pandas:pkg",
    ],
)
