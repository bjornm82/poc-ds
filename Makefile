include k8s/argo/Makefile
include k8s/mlflow/Makefile
include k8s/jupyter/Makefile
include k8s/seldon/Makefile
include k8s/istio/Makefile
include k8s/tf-operator/Makefile
include k8s/minio/Makefile
include k8s/gogs/Makefile
include k8s/registry/Makefile

include docker/mlflow/Makefile
include docker/tf-operator/Makefile
include docker/registry/Makefile

GIT_REPO ?= bjornm82/mlflow-test
HUB_ACCOUNT ?= bjornmooijekind

# admin
# admin123

# minio
# minio123

S3_BUCKET ?= "druid-index-eu-west-1"
AWS_PROFILE ?= "personal"
AWS_ACCESS_KEY_ID := $(shell aws configure get aws_access_key_id --profile ${AWS_PROFILE})
AWS_SECRET_ACCESS_KEY := $(shell aws configure get aws_secret_access_key --profile ${AWS_PROFILE})

.phony: build
build: build-mlflow \
	build-tf-operator \
	build-registry

.phony: push
push: push-mlflow \
	push-tf-operator \
	push-registry

.phony: create
create: helm-init \
	label-namespaces \
	create-gogs \
	create-registry \
	create-minio \
	create-istio-all \
	create-argo-all \
	create-mlflow-all \
	create-jupyter-all \
	create-tf-operator-all \
	create-seldon-all

.phony: delete
delete: delete-argo-all \
	delete-gogs \
	delete-registry \
	delete-minio \
	delete-mlflow-all \
	delete-jupyter-all  \
	delete-tf-operator-all \
	delete-seldon-all \
	delete-istio-all

.phony: helm-init
helm-init:
	helm init

.phony: label-namespaces
label-namespaces:
	kubectl label namespace default istio-injection=enabled --overwrite
