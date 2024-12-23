This repo demonstrates the python toolchain cache invalidation from
https://github.com/bazelbuild/rules_python/issues/2283.

## Overview
The repo contains a trivial python script (`main.py`) that imports a package from pip.
A python toolchain is configured using the latest versions of bazel (8.0.0) and rules_python
(1.0.0).

`pre-commit.sh` is a git pre-commit hook, used to abort a commit if any target fails to build.

## Setup

1. Clone the repo
2. Symlink `pre-commit.sh` to `.git/hooks/pre-commit`
3. `bazel build ...`
4. `git hook run pre-commit`

## Expected results

The first build, in step 3, should print messages like this:

```
Collecting pandas==2.1.4 (from -r /var/folders/28/qqqxx4y55dz08x1bzcc9z7jm0000gn/T/tmpyann5bc8 (line 1))
```

The second build, called from the pre-commit hook in step 4, shouldn't print any of these messages,
since the packages should already be cached.

## Observed results

The second build does print `Collecting pandas` messages, showing that the package cache is
invalidated.