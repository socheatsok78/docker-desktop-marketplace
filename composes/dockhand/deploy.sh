#!/bin/sh

set -e

ROOT_DIR=$(git rev-parse --show-toplevel)
NAMESPACE="dockhand"

if [ -z "${MP_DOCKER}" ]; then
	# use local version of values.yaml
	values="$ROOT_DIR/composes/dockhand/values.yaml"
else
	# use github hosted master version of values.yaml
	values="https://raw.githubusercontent.com/socheatsok78/docker-marketplace/refs/heads/main/composes/dockhand/values.yaml"
fi

docker compose \
	-p "$NAMESPACE" \
	-f "$ROOT_DIR/composes/dockhand/dockhand-compose.yaml" \
	-f "${values}" \
	up -d --remove-orphans
