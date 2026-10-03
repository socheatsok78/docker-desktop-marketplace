#!/bin/sh

set -e

ROOT_DIR=$(git rev-parse --show-toplevel)
NAMESPACE="portainer"

if [ -z "${MP_DOCKER}" ]; then
	# use local version of values.yaml
	values="$ROOT_DIR/composes/portainer/values.yaml"
else
	# use github hosted master version of values.yaml
	values="https://raw.githubusercontent.com/socheatsok78/docker-marketplace/refs/heads/main/composes/portainer/values.yaml"
fi

docker compose \
	-p "$NAMESPACE" \
	-f "$ROOT_DIR/composes/portainer/portainer-compose.yaml" \
	-f "${values}" \
	up -d --remove-orphans
