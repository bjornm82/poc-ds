
TF_OPERATOR_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.phony: create-tf-operator-all
create-tf-operator-all:
	kubectl apply -f ${TF_OPERATOR_PATH}/tf-operator/ns.yaml && \
	kubectl apply -f ${TF_OPERATOR_PATH}/tf-operator/crd.yaml -n tf-operator && \
	cat ${TF_OPERATOR_PATH}/tf-operator/dep.yaml | sed "s/{{HUB_ACCOUNT}}/${HUB_ACCOUNT}/g" | kubectl apply -n tf-operator -f -

.phony: delete-tf-operator-all
delete-tf-operator-all:
	cat ${TF_OPERATOR_PATH}/tf-operator/dep.yaml | sed "s/{{HUB_ACCOUNT}}/${HUB_ACCOUNT}/g" | kubectl delete -n tf-operator -f - && \
	kubectl delete -f ${TF_OPERATOR_PATH}/tf-operator/crd.yaml -n tf-operator && \
	kubectl delete -f ${TF_OPERATOR_PATH}/tf-operator/ns.yaml
