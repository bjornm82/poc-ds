include k8s/argo/Makefile
include k8s/mlflow/Makefile
include k8s/jupyter/Makefile
include k8s/seldon/Makefile
include k8s/istio/Makefile
include docker/mlflow/Makefile

GIT_REPO ?= bjornm82/mlflow-test
HUB_ACCOUNT ?= bjornmooijekind

S3_BUCKET ?= "druid-index-eu-west-1"
AWS_PROFILE ?= "personal"
AWS_ACCESS_KEY_ID := $(shell aws configure get aws_access_key_id --profile ${AWS_PROFILE})
AWS_SECRET_ACCESS_KEY := $(shell aws configure get aws_secret_access_key --profile ${AWS_PROFILE})

.phony: build
build: build-mlflow

.phony: push
push: push-mlflow

.phony: create
create: helm-init \
	label-namespaces \
	create-istio-all \
	create-argo-all \
	create-mlflow-all \
	create-jupyter-all \
	create-seldon-all

.phony: delete
delete: delete-argo-all \
	delete-mlflow-all \
	delete-jupyter-all  \
	delete-seldon-all \
	delete-istio-all

.phony: helm-init
helm-init:
	helm init

.phony: label-namespaces
label-namespaces:
	kubectl label namespace default istio-injection=enabled --overwrite
