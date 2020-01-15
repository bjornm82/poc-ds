TF_OPERATOR_DOCKER_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.phony: build-tf-operator
build-tf-operator:
	docker build -t ${HUB_ACCOUNT}/tf-operator:latest ${TF_OPERATOR_DOCKER_PATH}

.phony: push-tf-operator
push-tf-operator:
	docker push ${HUB_ACCOUNT}/tf-operator:latest
