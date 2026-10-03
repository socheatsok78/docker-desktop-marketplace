#!/bin/sh

set -e

NAMESPACE="portainer"

docker stack rm "$NAMESPACE"
