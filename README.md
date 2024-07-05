# OCI Hook for SHA1

Stages: https://github.com/opencontainers/runtime-spec/blob/v1.0.2/config.md#posix-platform-hooks

## Design

- [`hook.json`](contrib/hook.json) - OCI hook configuration to change policy at container startup

## Install

- [`generate-mc.sh`](generate-mc.sh) - Generate a MachineConfig for deployment
- [`generate-copy-n-paste.sh`](generate-copy-n-paste.sh) - Generate a copy-n-paste'able script for node debug pods

## Usage

    $ generate-mc.sh | oc apply -f -
    # Wait for MC to be done
    $ oc apply --wait -f manifests/pod.yaml
    pod/virt-launcher-crypto created
    $ oc logs virt-launcher-crypto
    DEFAULT:SHA1
    $ oc delete -f manifests/pod.yaml
