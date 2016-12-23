#!/bin/bash

docker exec --privileged -i rancher-agent bash << EOF
  ACCOUNT_ID=\`curl -sL "\${CATTLE_URL}/accounts?name=Default" | jq -r .data[].id\`
  echo \`curl -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
  -X POST \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{"description":"Development API key", "name":"development"}' \
  "\${CATTLE_URL}/projects/"\$ACCOUNT_ID"/apikeys"\`