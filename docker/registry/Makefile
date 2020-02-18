REGISTRY_DOCKER_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.phony: build-registry
build-registry:
	docker build -t ${HUB_ACCOUNT}/registry:latest ${REGISTRY_DOCKER_PATH}

.phony: push-registry
push-registry:
	docker push ${HUB_ACCOUNT}/registry:latest
