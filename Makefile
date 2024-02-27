build_0_29:
	docker run --rm \
		-e GOPROXY=https://proxy.golang.org \
		-e GOSUMDB=sum.golang.org \
		-v ${PWD}:/src -w /src \
		tinygo/tinygo:0.29.0 tinygo build -x \
		-o policy.wasm \
		-target=wasi \
		-no-debug .

build_0_30:
	docker run --rm \
		-v ${PWD}:/src -w /src \
		tinygo/tinygo:0.30.0 tinygo build -x \
		-o policy.wasm \
		-target=wasi \
		-no-debug .

build_0_31:
	docker run --rm \
		-v ${PWD}:/src -w /src \
		tinygo/tinygo:0.31.0 tinygo build -x \
		-o policy.wasm \
		-target=wasi \
		-no-debug .

build-container:
	DOCKER_BUILDKIT=1 docker build . -t tinygo:patched

build_patched:
	docker run --rm -v ${PWD}:/src -w /src tinygo:patched tinygo build -x \
		-o policy.wasm \
		-target=wasi \
		-no-debug .
