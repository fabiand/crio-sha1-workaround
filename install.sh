FSROOT=${FSROOT:-/}

cp -v oci-hook-host-cryptopolicies.sh $FSROOT/opt/oci-hook-host-cryptopolicies.sh
cp -v hook.json $FSROOT/run/containers/oci/hooks.d/oci-hook-host-cryptopolicies.json

