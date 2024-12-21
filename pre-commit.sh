#!/usr/bin/env bash

# pre-commit hook. ln -s this to .git/hooks/pre-commit.

set -x

# when this script is run as a git hook, git sets GIT_EXEC_PATH automatically.
# when this script is run directly, this should not be set.
env | grep GIT_EXEC_PATH

bazel build ...