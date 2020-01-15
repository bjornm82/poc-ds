
ML_FLOW_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.phony: create-mlflow-all
create-mlflow-all: create-mlflow-ns \
	create-postgres \
	create-mlflow \
	expose-mlflow

.phony: create-mlflow-ns
create-mlflow-ns:
	kubectl create ns mlflow

.phony: create-mlflow
create-mlflow:
	cat ${ML_FLOW_PATH}/mlflow/dep.yaml | sed "s/{{HUB_ACCOUNT}}/${HUB_ACCOUNT}/g" | sed "s/{{AWS_ACCESS_KEY_ID}}/${AWS_ACCESS_KEY_ID}/g" | sed "s/{{AWS_SECRET_ACCESS_KEY}}/${AWS_SECRET_ACCESS_KEY}/g" | kubectl apply -n mlflow -f - && \
	kubectl apply -f ${ML_FLOW_PATH}/mlflow/svc.yaml -n mlflow

.phony: create-postgres
create-postgres:
	kubectl apply -f ${ML_FLOW_PATH}/postgres -n mlflow

.phony: delete-mlflow-all
delete-mlflow-all: delete-mlflow \
	delete-postgres \
	delete-mlflow-ns

.phony: delete-mlflow-ns
delete-mlflow-ns:
	kubectl delete ns mlflow

.phony: delete-mlflow
delete-mlflow:
	cat ${ML_FLOW_PATH}/mlflow/dep.yaml | sed "s/{{HUB_ACCOUNT}}/${HUB_ACCOUNT}/g" | sed "s/{{AWS_ACCESS_KEY_ID}}/${AWS_ACCESS_KEY_ID}/g" | sed "s/{{AWS_SECRET_ACCESS_KEY}}/${AWS_SECRET_ACCESS_KEY}/g" | kubectl delete -n mlflow -f - && \
	kubectl delete -f ${ML_FLOW_PATH}/mlflow/svc.yaml -n mlflow

.phony: delete-postgres
delete-postgres:
	kubectl delete -f ${ML_FLOW_PATH}/postgres -n mlflow

.phony: expose-mlflow
expose-mlflow:
	kubectl patch svc mlflow-server -p '{"spec": {"type": "LoadBalancer"}}' -n mlflow
