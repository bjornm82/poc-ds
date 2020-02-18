

.PHONY: create-concourse
create-concourse:
	kubectl create ns concourse
	helm repo add concourse https://concourse-charts.storage.googleapis.com && \
	helm install --wait --name concourse concourse/concourse --set concourse.web.bindPort=8081 --namespace concourse && \
	kubectl expose deployment concourse-web --type=LoadBalancer --namespace concourse --name=concourse-web-http

.PHONY: delete-concourse
delete-concourse:
	helm delete --purge concourse && \
	kubectl delete svc concourse-web-http --namespace concourse && \
	kubectl delete ns concourse-main && \
	kubectl delete ns concourse
