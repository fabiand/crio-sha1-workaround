#!/usr/bin/bash

echo "Running $0"

set -x

POD_NAME=$(jq -er '.annotations["io.kubernetes.pod.name"]' < config.json)

if [[ "$POD_NAME" =~ "virt-launcher".* ]];
then
  CONTAINERID=$(jq -er '.annotations["io.kubernetes.cri-o.ContainerID"]' < config.json)
  runc exec $CONTAINERID update-crypto-policies --set DEFAULT:SHA1
  runc exec $CONTAINERID update-crypto-policies --show
  # should show: DEFAULT:SHA1
fi



