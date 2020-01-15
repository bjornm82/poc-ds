ISTIO_PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.phony: create-istio-all
create-istio-all: create-istio-ns create-istio-secrets create-istio create-istio-wait

.phony: create-istio-ns
create-istio-ns:
	kubectl create ns istio-system

.phony: create-istio-secrets
create-istio-secrets:
	kubectl apply -f ${ISTIO_PATH}/istio/secrets.yaml

.phony: create-istio
create-istio:
	istioctl manifest apply --set values.sidecarInjectorWebhook.enabled=true --set values.kiali.enabled=true

.phony: create-istio-wait
create-istio-wait:
	kubectl wait --for=condition=available --timeout=600s deployment/istio-ingressgateway -n istio-system

.phony: delete-istio-all
delete-istio-all: delete-istio

.phony: delete-istio delete-istio-ns
delete-istio:
	istioctl manifest generate --set values.sidecarInjectorWebhook.enabled=true --set values.kiali.enabled=true | kubectl delete -f -

.phony: delete-istio-ns
delete-istio-ns:
	kubectl delete ns istio-system
