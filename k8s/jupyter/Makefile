
JUPYTER_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.phony: create-jupyter-all
create-jupyter-all: create-jupyter-namespace create-jupyter

.phony: create-jupyter
create-jupyter:
	kubectl apply -n jupyter -f ${JUPYTER_PATH}/jupyter -n jupyter

.phony: create-jupyter-namespace
create-jupyter-namespace:
	kubectl create namespace jupyter

.phony: delete-jupyter-all
delete-jupyter-all: delete-jupyter delete-jupyter-namespace

.phony: delete-jupyter
delete-jupyter:
	kubectl delete -f ${JUPYTER_PATH}/jupyter -n jupyter

.phony: delete-jupyter-namespace
delete-jupyter-namespace:
	kubectl delete ns jupyter
