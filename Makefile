.PHONY: all build_and_push

all: build_and_push
	@echo "=== DONE ==="

build_and_push:
	docker login --username=ajv21 -p=Jun21@2021
	docker buildx create --name mybuildkit
	docker buildx use mybuildkit
	docker buildx inspect --bootstrap
	docker run --rm --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d
	docker buildx build -t ajv21/jira-resource:latestone --platform linux/arm64,linux/amd64 --push .
	docker buildx rm mybuildkit
