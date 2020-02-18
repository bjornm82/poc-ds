
REGISTRY_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: create-registry
create-registry:
	kubectl apply -f ${REGISTRY_PATH}/manifest.yaml

.PHONY: delete-registry
delete-registry:
	kubectl delete -f ${REGISTRY_PATH}/manifest.yaml
