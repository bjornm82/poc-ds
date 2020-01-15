MLFLOW_DOCKER_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.phony: build-mlflow
build-mlflow:
	docker build --build-arg S3_BUCKET=${S3_BUCKET} -t ${HUB_ACCOUNT}/mlflow:latest ${MLFLOW_DOCKER_PATH}

.phony: push-mlflow
push-mlflow:
	docker push ${HUB_ACCOUNT}/mlflow:latest
