

.PHONY: create-gogs
create-gogs:
	kubectl create ns gogs && \
	helm install --wait --name gogs incubator/gogs --set service.gogs.serverDomain=docker.me:3000 --set service.gogs.serverRootUrl=http://docker.me:3000 --namespace gogs && \
	kubectl expose deployment gogs-gogs -n gogs --type=LoadBalancer --name=gogs-http

.PHONY: delete-gogs
delete-gogs:
	helm delete --purge gogs && \
	kubectl delete ns gogs
