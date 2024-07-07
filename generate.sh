#!/usr/bin/bash

WHAT=contrib/90-sha1
WHERE=/etc/crio/crio.conf.d/90-sha1

case $1 in

	s)
echo "cat > $WHERE <<'EOF'"
cat $WHAT
echo "EOF"
	;;


	*)
cat <<EOY
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfig
metadata:
  labels:
    machineconfiguration.openshift.io/role: worker
  name: 99-install-crio-sha1-workaround
spec:
  config:
    ignition:
      version: 3.2.0
    storage:
      files:
        - contents:
            source: "data:text/plain;charset=utf-8;base64,$(base64 -w 0 $WHAT)"
          filesystem: root
          mode: 0644
          path: $WHERE
EOY
	;;



esac

