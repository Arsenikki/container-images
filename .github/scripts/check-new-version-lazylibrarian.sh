#!/bin/bash
TEMPFILE=$1

REPO=linuxserver/lazylibrarian                                                                                                                                                                          

TOKEN=$(curl -s "https://auth.docker.io/token?service=registry.docker.io&scope=repository:${REPO}:pull" \
  | jq -r '.token')

VERSION=`curl -s -H "Authorization: Bearer $TOKEN" "https://registry-1.docker.io/v2/${REPO}/manifests/latest" \
  | jq ".history[0].v1Compatibility" -r | jq '.config.Labels."org.opencontainers.image.version"'`

echo $VERSION > $TEMPFILE
echo "Created $TEMPFILE file with tag: $VERSION"