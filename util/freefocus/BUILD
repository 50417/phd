# The FreeFous task manager.

load("@org_pubref_rules_protobuf//python:rules.bzl", "py_proto_library")

py_binary(
    name = "freefocus",
    srcs = ["freefocus.py"],
    deps = [
        ":sql",
        "//third_party/py/absl",
    ],
)

py_proto_library(
    name = "freefocus_py_pb2",
    protos = ["freefocus.proto"],
    visibility = ["//visibility:public"],
    deps = ["//third_party/py/protobuf"],
)

py_library(
    name = "sql",
    srcs = ["sql.py"],
    visibility = ["//util/freefocus:__subpackages__"],
    deps = [
        ":freefocus_py_pb2",
        "//lib/labm8:labdate",
        "//lib/labm8:sqlutil",
        "//third_party/py/absl",
    ],
)

py_test(
    name = "sql_test",
    srcs = ["sql_test.py"],
    deps = [
        ":freefocus_py_pb2",
        ":sql",
        "//third_party/py/absl",
        "//third_party/py/pytest",
    ],
)

py_library(
    name = "sql_ops",
    srcs = ["sql_ops.py"],
    visibility = ["//util/freefocus:__subpackages__"],
)
