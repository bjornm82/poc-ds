

.PHONY: create-gogs
create-gogs:
	helm install --name gogs incubator/gogs --set service.gogs.serverDomain=docker.me:3000 --set service.gogs.serverRootUrl=http://docker.me:3000

.PHONY: delete-gogs
delete-gogs:
	helm delete --purge gogs
