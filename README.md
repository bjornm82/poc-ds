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

## Prerequisites

* Access to dockerhub and logged in via console
* Access to git and a deploy key with write access (https://github.com/{{account}}/{{repo}}/settings/keys/new)
* Access to S3 (via cli will inject the credentials)

* make
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

## Getting started

1. Create an S3 bucket of your choice

2. `$ S3_BUCKET=bucket HUB_ACCOUNT=account make build` should build all images needed for the project

3. `$ HUB_ACCOUNT=account make push` should push the images to your docker hub

4. `$ S3_BUCKET=bucket AWS_PROFILE=aws_profile GIT_REPO=account/repo HUB_ACCOUNT=account make create` should create the cluster

5. `$ S3_BUCKET=bucket AWS_PROFILE=aws_profile GIT_REPO=account/repo HUB_ACCOUNT=account make delete` should delete the cluster

TODO: when deleting the cluster it will raise errors on the istio removal, not sure if I want to fix it
