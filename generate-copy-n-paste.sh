FSROOT=${FSROOT:-/}

echo "cat > $FSROOT/opt/oci-hook-host-cryptopolicies.sh <<'EOF'"
cat contrib/hook.sh
echo "EOF"
echo "chmod a+x $FSROOT/opt/oci-hook-host-cryptopolicies.sh"

echo "cat > $FSROOT/run/containers/oci/hooks.d/oci-hook-host-cryptopolicies.json <<'EOF'"
cat contrib/hook.json
echo "EOF"

