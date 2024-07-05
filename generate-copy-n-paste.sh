FSROOT=${FSROOT:-/}

echo "cat > $FSROOT/run/containers/oci/hooks.d/oci-hook-host-cryptopolicies.json <<'EOF'"
cat contrib/hook.json
echo "EOF"

