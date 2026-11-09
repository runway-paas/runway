#!/usr/bin/env bash
# Create or delete the local Runway kind cluster.
# Usage: scripts/cluster.sh up|down

set -euo pipefail

CLUSTER_NAME="runway"
CONFIG_FILE="$(dirname "$0")/../kind/cluster.yaml"

if ! docker info > /dev/null 2>&1; then
  echo "Docker isn't running. Start Docker Desktop and try again."
  exit 1
fi

case "${1:-}" in
  up)
    if kind get clusters | grep -qx "$CLUSTER_NAME"; then
      echo "Cluster '$CLUSTER_NAME' already exists."
    else
      kind create cluster --config "$CONFIG_FILE"
    fi
    kubectl wait --for=condition=Ready nodes --all --timeout=90s
    ;;
  down)
    kind delete cluster --name "$CLUSTER_NAME"
    ;;
  *)
    echo "Usage: $0 up|down"
    exit 1
    ;;
esac