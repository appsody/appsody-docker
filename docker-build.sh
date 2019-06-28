#!/bin/bash
set -e
docker build -t appsody/appsody-docker .
docker push appsody/appsody-docker