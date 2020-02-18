
.PHONY: create-minio
create-minio:
	kubectl create ns minio && \
	kubectl apply -f https://github.com/minio/minio/blob/master/docs/orchestration/kubernetes/minio-standalone-pvc.yaml?raw=true -n minio && \
	kubectl apply -f https://github.com/minio/minio/blob/master/docs/orchestration/kubernetes/minio-standalone-deployment.yaml?raw=true -n minio && \
	kubectl apply -f https://github.com/minio/minio/blob/master/docs/orchestration/kubernetes/minio-standalone-service.yaml?raw=true -n minio
	./bin/mc-darwin config host add minio http://localhost:9000 minio minio123 --api S3v4

.PHONY: delete-minio
delete-minio:
	kubectl delete -f https://github.com/minio/minio/blob/master/docs/orchestration/kubernetes/minio-standalone-deployment.yaml?raw=true -n minio && \
	kubectl delete -f https://github.com/minio/minio/blob/master/docs/orchestration/kubernetes/minio-standalone-service.yaml?raw=true -n minio && \
	kubectl delete -f https://github.com/minio/minio/blob/master/docs/orchestration/kubernetes/minio-standalone-pvc.yaml?raw=true -n minio && \
	kubectl delete ns minio
