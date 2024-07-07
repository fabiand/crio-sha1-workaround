# CRI-O Conf for SHA1

- https://fedoraproject.org/wiki/SHA1SignaturesGuidance

## Design

Install a CRIO snippet for setting the SHA1 env var.

## Install

- [`generate.sh`](generate.sh) - Generate a MachineConfig for deployment - or - a shell script

## Usage

    $ generate.sh mc | oc apply -f -

    # Wait for MC to be done
    $ oc wait mcp worker --for condition=Updated=False --timeout=10s
    $ oc wait mcp worker --for condition=Updated=True --timeout=15m

    $ oc apply --wait -f manifests/pod.yaml
    pod/virt-launcher-crypto created

    $ oc logs virt-launcher-crypto
    OPENSSL_ENABLE_SHA1_SIGNATURES=1

    $ oc delete -f manifests/pod.yaml
