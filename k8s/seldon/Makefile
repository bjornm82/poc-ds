SELDON_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.phony: create-seldon-all
create-seldon-all: create-seldon-ns create-seldon-core

.phony: create-seldon-ns
create-seldon-ns:
	kubectl apply -f ${SELDON_PATH}/seldon/ns.yaml

.phony: create-seldon-core
create-seldon-core:
	helm install --set usageMetrics.enabled=true --set istio.enabled=true --repo https://storage.googleapis.com/seldon-charts --namespace seldon-system seldon-core --name seldon-core-operator

.phony: delete-seldon-all
delete-seldon-all: delete-seldon-core delete-seldon-ns

.phony: delete-seldon-core
delete-seldon-core:
	helm delete seldon-core-operator --purge

.phony: delete-seldon-ns
delete-seldon-ns:
	kubectl delete ns seldon-system
