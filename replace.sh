#!/usr/bin/env bash

export GHUSER=$1
export GHREPO=$2
export DOCKERREPO=$3

#Substitute placeholders in build.yaml
sed -i "" "s/GHUSER/${GHUSER}/g" build.yaml
sed -i "" "s/GHREPO/${GHREPO}/g" build.yaml
sed -i "" "s/<repo>/${DOCKERREPO}/g" build.yaml
sed -i "" "s/<tag>/nginx:v3/g" build.yaml

#Substitute placeholders in Dockerfile
sed -i "" "s/v_x/3/g" Dockerfile
#Substitute placeholders in the Kubernetes deployment file
sed -i "" "s/<repo>/${DOCKERREPO}/g" workloads/nginx-deployment.yaml
sed -i "" "s/<tag>/nginx:v3/g" workloads/nginx-deployment.yaml
