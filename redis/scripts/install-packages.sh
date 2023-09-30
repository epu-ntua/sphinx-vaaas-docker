#!/usr/bin/env bash

apt-get update

apt-get install -y curl

apt-get update

{ cat <<EOF
libhiredis-dev
redis-server
redis-tools
EOF
} | xargs apt-get install -yq --no-install-recommends

rm -rf /var/lib/apt/lists/*
