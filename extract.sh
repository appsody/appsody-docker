#!/bin/bash

# gitsource variable is supplied by the caller.
cd /workspace/$gitsource

# The below variable is used in extract for overlaying
# the current location into the image file system.
# Its necessity will depend on resolution of
# https://github.com/appsody/stacks/issues/280
# export APPSODY_MOUNT_PROJECT=`pwd`
# echo APPSODY_MOUNT_PROJECT=${APPSODY_MOUNT_PROJECT}

# Extract everything into /workspace/extracted, the image
# content goes to the vortex, content in the current
# folder into user-app, and the rest, as per the mounts.
appsody extract --buildah --target-dir /workspace/extracted -v
