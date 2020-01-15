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

## Getting started

Create an S3 bucket

`$ make build` should build all images needed for the project

`$ make push` should push the images to your docker hub

**Example of command:**

```
$ S3_BUCKET=bucket AWS_PROFILE=personal GIT_REPO=account/repo HUB_ACCOUNT=account make create
```

When replacing values with your own, the command should create the cluster.

## Notes

Check if you're logged in at the docker registry via cli

`$ docker login`

Check for if your credentials are set within via aws cli

`$ aws configure get aws_access_key_id --profile {profile}`
