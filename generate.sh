#!/usr/bin/bash

WHAT=$1

DST=/etc/containers/oci/hooks.d/oci-hook-sha1.json

case $WHAT in

	s)
echo "cat > $DST <<'EOF'"
cat contrib/hook.json
echo "EOF"
	;;


	*)
cat <<EOY
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfig
metadata:
  labels:
    machineconfiguration.openshift.io/role: worker
  name: 99-install-oci-hook-sha1
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
          path: $DST
EOY
	;;



esac

