#!/bin/bash

# Contract:
# $context = the extraction root
# $gitsource = the target application, plus reference to docker image
# $dockerfile = the target image name
# Steps:
# 1. Go to $gitsource. Parse the config yaml to get the source image
# 2. Pull the image
# 3. Spin up a container out of it
# 4. Copy the extracted content from the container mount to $context
# 5. Copy the git source to $context/user-app
# 5. Re-build the image, using the Docker file rom the source image
# 6. Push the image
# 7. Delete the container, and the image.

mkdir -p $context
stack=`cat $context/../git-source/.appsody-config.yaml | awk -F' ' '{print $2}'`
buildah pull $stack
buildah from --name base-extract $stack
cid=`buildah ps -aq`
iid=`buildah images -aq`
mount=`buildah mount base-extract`
cp -rf $mount/project/* $context
cp -rf $context/../$gitsource/* $context/user-app
cd $context
buildah bud -f Dockerfile -t $dockerimage .
buildah push $dockerimage
buildah rm $cid
buildah rmi $iid
