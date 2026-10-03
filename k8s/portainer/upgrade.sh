#!/bin/sh

set -e

################################################################################
# repo
################################################################################
helm repo add portainer	https://portainer.github.io/k8s/
helm repo update > /dev/null

################################################################################
# chart
################################################################################
STACK="portainer"
CHART="portainer/portainer"
NAMESPACE="portainer"

if [ -z "${MP_KUBERNETES}" ]; then
    # use local version of values.yml
    ROOT_DIR=$(git rev-parse --show-toplevel)
    values="$ROOT_DIR/k8s/portainer/values.yml"
else
    # use github hosted master version of values.yml
    values="https://raw.githubusercontent.com/socheatsok78/docker-marketplace/refs/heads/main/k8s/portainer/values.yaml"
fi

helm upgrade "$STACK" "$CHART" \
--namespace "$NAMESPACE" \
--values "$values"
