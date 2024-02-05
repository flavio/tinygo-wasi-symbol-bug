This repository contains a small reproducer for a [this tinygo issue](https://github.com/tinygo-org/tinygo/issues/4114).

## Requirements

- docker
- make

## How to reproduce the issue

Run the following command to reproduce the issue:

```console
make build_0_30
```

The process will exit with an error similar to the following one:

```console
[parse exception: invalid function index (at 0:33625)]
```

The error is raised by `wasm-opt`.

The bug is currently happening with tinygo v0.30.0, which ships `wasm-opt` 114.

I can reprodce the issue also with latest version of `wasm-opt` (v116):

## Build with tinygo 0.29

The same error can be found with tinygo 0.29:

```console
make build_0_29
```

## Use latest `wasm-opt`

Build the container based on tinygo 0.30.0 that has `wasm-opt` 116:

```console
make build-container
```

Reproduce the issue:

```console
make build_patched
```

The process will error in the same way.
