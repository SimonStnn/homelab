#!/bin/bash

# Script to ensure Docker is configured with a persistent root directory
# and can be verified by "docker info --format '{{.DockerRootDir}}'".
#
# Usage: ./configure-docker-rootdir.sh [target-data-root]
# Example: ./configure-docker-rootdir.sh /mnt/sdcard/docker

set -euo pipefail

TARGET_ROOT=${1:-/mnt/sdcard/docker}
DAEMON_JSON=/etc/docker/daemon.json

echo "Target Docker data-root: $TARGET_ROOT"

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

mkdir -p "$TARGET_ROOT"
chown root:root "$TARGET_ROOT"
chmod 0755 "$TARGET_ROOT"

mkdir -p /etc/docker

# Create or update daemon.json safely
cat > "$DAEMON_JSON" <<EOF
{
  "data-root": "$TARGET_ROOT"
}
EOF

echo "Wrote $DAEMON_JSON"

# Ensure Docker service is installed / enabled
if ! command -v docker >/dev/null 2>&1; then
  echo "Docker CLI not found. Installing docker.io via apt..."
  DEBIAN_FRONTEND=noninteractive apt-get update
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends docker.io
fi

systemctl daemon-reload
systemctl enable --now docker

echo "Restarting docker service to apply config..."
systemctl restart docker

sleep 2

CURRENT_ROOT=$(docker info --format '{{.DockerRootDir}}' 2>/dev/null || true)

if [ "$CURRENT_ROOT" != "$TARGET_ROOT" ]; then
  echo "ERROR: docker root dir is '$CURRENT_ROOT' but expected '$TARGET_ROOT'" >&2
  echo "Command: docker info --format '{{.DockerRootDir}}'" >&2
  exit 2
fi

echo "SUCCESS: docker root dir is configured as: $CURRENT_ROOT"
exit 0
