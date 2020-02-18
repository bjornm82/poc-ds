# Docker-MLflow

This repo contains a very simple k8s deployment for:
* MLflow
* Argo CD
* Argo Workflow
* Argo Events
* Jupyter notebook
* TF Operator
* Seldon
* Istio

* MinIO
* Registry
* Git

## Prerequisites

* Access to dockerhub and logged in via console
* Access to git and a deploy key with write access (https://github.com/{{account}}/{{repo}}/settings/keys/new)
* Access to S3 (via cli will inject the credentials)

* make
* DVC version 0.80.0 (brew)
* istioctl version 1.4.3 (brew)
* helm version 2.16.1 not 3.x (brew)
* kubernetes > version 1.12 (recommended docker for mac)
* docker > version 19.03.5 (recommended docker for mac)

* Kubernetes requirements: 10 CPU and 14 GB memory

## Prerequisite checks

#### Check login docker

Check if you're logged in at the docker registry via cli

`$ docker login`

if you're already authenticated it will show

```
Authenticating with existing credentials...
Login Succeeded
```

#### Check AWS credentials

Check for if your credentials are set within via aws cli

`$ aws configure get aws_access_key_id --profile {profile}`

#### AWS Profile
Verify the profile you want to use

`$ cat ~/.aws/credentials`

Most likely default will be present at least

#### DVC remote
Adding all data to a remote versioned environment

`$ dvc init` in your code repository

`$ dvc remote add -d {name_remote} s3://{bucket}/{folder}`

Flag -d will ensure that {name_remote} is the default location

## Getting started (setup)

1. Set your profile by ENV var for the right AWS account `$ AWS_PROFILE=personal`

2. Create an S3 bucket of your choice

3. `$ S3_BUCKET=bucket HUB_ACCOUNT=account make build` should build all images needed for the project

4. `$ HUB_ACCOUNT=account make push` should push the images to your docker hub

5. `$ S3_BUCKET=bucket AWS_PROFILE=aws_profile GIT_REPO=account/repo HUB_ACCOUNT=account make create` should create the cluster

6. `$ S3_BUCKET=bucket AWS_PROFILE=aws_profile GIT_REPO=account/repo HUB_ACCOUNT=account make delete` should delete the cluster

TODO: when deleting the cluster it will raise errors on the istio removal, not sure if I want to fix it

TODO: Might need following for proper publishing via mlflow server
S3_ENDPOINT=s3-eu-west-1.amazonaws.com
AWS_REGION=eu-west-1

## Notes

Login argocd by using the username admin and password is the name of the pod
`$ kubectl get pods -n argocd | grep argocd-server | awk '{print $1}'`

Login kiali has default admin / admin username and password
