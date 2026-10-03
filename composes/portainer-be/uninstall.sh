#!/bin/sh

set -e

ROOT_DIR=$(git rev-parse --show-toplevel)
NAMESPACE="portainer"

docker compose -p "$NAMESPACE" down --remove-orphans --volumes
