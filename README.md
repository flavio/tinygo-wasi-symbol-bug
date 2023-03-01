This repository contains a small reproducer for a [this tinygo issue](https://github.com/tinygo-org/tinygo/issues/3501).

## Requirements

* docker
* make

## How to reproduce the issue

Run the following command to reproduce the issue:

```console
make bug
```

The process will exit with an error similar to the following one:

```console
clang -mbulk-memory -mnontrapping-fptoint -msign-ext --sysroot=/usr/local/tinygo/lib/wasi-libc/sysroot -gdwarf-4 -Oz --target=wasm32-unknown-wasi -mcpu=generic -MD -MV -MTdeps -MF /tmp/tinygo4032866656/dep-2391943184.d -flto=thin -c -o /home/tinygo/.cache/tinygo/tmp-206382876.bc /usr/local/tinygo/src/internal/task/task_asyncify_wasm.S -Qunused-arguments
clang -mbulk-memory -mnontrapping-fptoint -msign-ext --sysroot=/usr/local/tinygo/lib/wasi-libc/sysroot -gdwarf-4 -Oz --target=wasm32-unknown-wasi -mcpu=generic -MD -MV -MTdeps -MF /tmp/tinygo4032866656/dep-2007613575.d -flto=thin -c -o /home/tinygo/.cache/tinygo/tmp-2933464424.bc /usr/local/tinygo/src/runtime/asm_tinygowasm.S -Qunused-arguments
wasm-ld --stack-first --no-demangle -L /usr/local/tinygo -o /tmp/tinygo4032866656/main --strip-debug --compress-relocations /tmp/tinygo4032866656/main.o /home/tinygo/.cache/tinygo/obj-0bfb1c88ecd5881542b47db010b5787164fc6a554d252cff6bd66805.bc /home/tinygo/.cache/tinygo/obj-21efc40633d7331a1c71e816bcdcc1a96f69a1f1969201b2c8be7b5f.bc /usr/local/tinygo/lib/wasi-libc/sysroot/lib/wasm32-wasi/libc.a -mllvm -mcpu=generic --lto-O2 --thinlto-cache-dir=/home/tinygo/.cache/tinygo/thinlto -mllvm --rotation-max-header-size=0
tinygo:wasm-ld: error: lto.tmp: undefined symbol: __multi3
failed to run tool: wasm-ld
error: failed to link /tmp/tinygo4032866656/main: exit status 1
```

## Dirty workaround

Build the container image that has the workaround:

```console
make build-container
```

This will create a container image named `tinygo:patched`.

Execute the following command:

```console
make build
```

This time the build process will complete successfully. A WebAssembly module
named `policy.wasm` can be found inside of the root of the project.

The module can be run with wasmtime:

```console
wasmtime run policy.wasm
```
