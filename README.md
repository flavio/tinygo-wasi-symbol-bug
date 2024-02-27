This repository contains a small reproducer for a [this tinygo issue](https://github.com/tinygo-org/tinygo/issues/4114).

## Requirements

- docker
- make

## How to reproduce the issue

Run the following command to reproduce the issue:

```console
make build_0_31
```

The process will exit with an error similar to the following one:

```console
[parse exception: invalid function index (at 0:33625)]
```

The error is raised by `wasm-opt`.

The bug is currently happening with tinygo v0.31.0, which ships `wasm-opt` 116.

The bug affects also older releases of TinyGo.
