#!/usr/bin/bash

WHAT=$1

case $WHAT in
	mc|machineconfig)
cat <<EOY
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfig
metadata:
  labels:
    machineconfiguration.openshift.io/role: worker
  name: 99-install-oci-hook-cryptopolicies
spec:
  config:
    ignition:
      version: 3.2.0
    storage:
      files:
        - contents:
            source: "data:text/plain;charset=utf-8;base64,$(base64 -w 0 contrib/hook.json)"
          filesystem: root
          mode: 0644
          path: /etc/containers/oci/hooks.d/oci-hook-host-cryptopolicies.json
EOY
	;;

	shell)
echo "cat > $FSROOT/run/containers/oci/hooks.d/oci-hook-host-cryptopolicies.json <<'EOF'"
cat contrib/hook.json
echo "EOF"
	;;

	*)
	echo -e "Usage: $0 <mc|shell>\nERR '$WHAT' not in (mc|shell)"
	exit 1
	;;
esac

