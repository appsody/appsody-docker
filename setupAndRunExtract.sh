#!/bin/bash
set -e
# inspecting the container to find the mounts
containerid=`docker ps|grep appsody-docker|awk '{print $1}'`
dockerinspect=`docker inspect ${containerid}`
# checking the mounts to extract the workspace mount
notdone=true
found=false
idx=0
while [ "$notdone" = true ]; do
  dest=`echo ${dockerinspect}|jq --argjson index $idx '.[] | .Mounts[$index].Destination '`
  echo $dest
  if [ "$dest" = "\"/workspace\"" ] ; then
     source=`echo ${dockerinspect}|jq --argjson index $idx '.[] | .Mounts[$index].Source '`
     found=true
     notdone=false
  elif [ "$dest" == null ]; then
     notdone=false
  fi
  idx=$[$idx+1]
  
done
if [ ! "$found" = true ] ; then
  echo Could not find a workspace mount - something is wrong
  exit 1
else
  echo Source mount is ${source}
# Removing the quotes
  source="${source%\"}"
  source="${source#\"}"
fi
# Appending appsody-source
  postfix="/appsody-source"
  source=$source$postfix
export APPSODY_MOUNT_PROJECT=${source}
echo APPSODY_MOUNT_PROJECT=${APPSODY_MOUNT_PROJECT}
# Create the /extracted sub-dir
mkdir /workspace/extracted
# Run appsody extract -v from the source directory
cd /workspace/appsody-source
ls -latr
appsody extract -v
# Copy the extracted contents to /workspace/extracted
cp -rf /builder/home/.appsody/extract/appsody-source/* /workspace/extracted/
ls -latr /workspace/extracted

