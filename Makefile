build:
	docker run --rm -v ${PWD}:/src -w /src tinygo:patched tinygo build -x \
		-o policy.wasm \
		-target=wasi \
		-no-debug .

build-container:
	DOCKER_BUILDKIT=1 docker build . -t tinygo:patched

bug:
	docker run --rm -v ${PWD}:/src -w /src tinygo/tinygo:0.27.0 tinygo build -x \
		-o policy.wasm \
		-target=wasi \
		-no-debug .

run:
	wasmtime run policy.wasm
