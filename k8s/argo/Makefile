
.phony: create-argo-all
create-argo-all: create-namespace-argo-wf create-argo-wf create-argo-cd-namespace create-argo-cd create-argo-events expose-argo-wf expose-argocd

.phony: create-namespace-argo-wf
create-namespace-argo-wf:
	kubectl create namespace argo

.phony: create-argo-wf
create-argo-wf:
	kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/stable/manifests/install.yaml

# .phony: patch-argo-wf
# patch-argo-wf:
# 	kubectl patch svc argo-ui -n argo -p '{"spec": {"type": "LoadBalancer"}}'

.phony: expose-argo-wf
expose-argo-wf:
	kubectl expose deployment argo-ui -n argo --type=LoadBalancer --name=argo-ui-http --port 8001

.phony: create-argo-cd
create-argo-cd:
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

.phony: create-argo-cd-namespace
create-argo-cd-namespace:
	kubectl create namespace argocd

.phony: expose-argocd
expose-argocd:
	kubectl expose deployment argocd-server --type=LoadBalancer -n argocd --name=http-argocd

.phony: create-argo-events
create-argo-events:
	kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-events/master/hack/k8s/manifests/installation.yaml

.phony: delete-argo-all
delete-argo-all: delete-argo-wf delete-argo-wf-namespace delete-argo-cd delete-argo-cd-namespace delete-argo-events

.phony: delete-argo-wf-namespace
delete-argo-wf-namespace:
	kubectl delete namespace argo

.phony: delete-argo-wf
delete-argo-wf:
	kubectl delete -n argo -f https://raw.githubusercontent.com/argoproj/argo/stable/manifests/install.yaml

.phony: delete-argo-cd-namespace
delete-argo-cd-namespace:
	kubectl delete namespace argocd

.phony: delete-argo-cd
delete-argo-cd:
	kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

.phony: delete-argo-events
delete-argo-events:
	kubectl delete -f https://raw.githubusercontent.com/argoproj/argo-events/master/hack/k8s/manifests/installation.yaml
