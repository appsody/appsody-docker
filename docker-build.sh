#!/bin/bash
set -e
docker build -t $DOCKER_ORG/appsody-docker .
docker push $DOCKER_ORG/appsody-docker