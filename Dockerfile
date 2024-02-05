# syntax=docker/dockerfile:1-labs

FROM alpine AS downloader
ADD --checksum=sha256:c55b74f3109cdae97490faf089b0286d3bba926bb6ea5ed00c8c784fc53718fd https://github.com/WebAssembly/binaryen/releases/download/version_116/binaryen-version_116-x86_64-linux.tar.gz /
RUN tar xvf /binaryen-version_116-x86_64-linux.tar.gz

FROM "tinygo/tinygo:0.30.0"
COPY --from=downloader binaryen-version_116/bin/wasm-opt /usr/local/tinygo/bin/wasm-opt
