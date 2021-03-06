#!/bin/bash
TEMPFILE=$1

UPSTREAM=`curl -s -H "Authorization: token $SUPERSECRETPAT" https://api.github.com/orgs/k8s-at-home/packages/container/qbittorrent/versions \
  | jq -r '.[0] .metadata.container.tags | map(select(contains("v"))) | .[]'`

MINE=`curl -s -H "Authorization: token $SUPERSECRETPAT" https://api.github.com/users/Arsenikki/packages/container/qbittorrent/versions \
  | jq -r '.[0] .metadata.container.tags[0]'`

echo $UPSTREAM
echo $MINE

if [ $UPSTREAM != $MINE ]; then
  echo "Upstream version '$UPSTREAM' is different from mine '$MINE'."
  echo $UPSTREAM > $TEMPFILE
  echo "Created $TEMPFILE file with tag '$UPSTREAM'."
  exit 0
fi

exit 666