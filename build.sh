#!/bin/bash

#Takes two parms:
#CLI_VERSION
#TRAVIS_TAG

set -e
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t $DOCKER_ORG/appsody-docker:$2 -t $DOCKER_ORG/appsody-docker:latest --build-arg CLI_VERSION=$1 .
docker push $DOCKER_ORG/appsody-docker