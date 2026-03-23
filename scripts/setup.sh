#!/bin/bash

# Setup script for homelab workspace
# Creates necessary symlinks and performs initial configuration.

# Create symlink to SD card volumes if it doesn't already exist
TARGET="/mnt/sdcard/homelab-volumes"
LINK="/opt/docker/homelab-volumes"

if [ ! -e "$LINK" ]; then
  ln -s "$TARGET" "$LINK"
  echo "Created symlink: $LINK -> $TARGET"
else
  echo "Symlink or target already exists: $LINK"
fi

# Ensure Docker network 'homelab' exists
if ! docker network inspect homelab >/dev/null 2>&1; then
  docker network create homelab
  echo "Created Docker network: homelab"
else
  echo "Docker network 'homelab' already exists"
fi

# Parse options
declare START_ALL=false
while [ "$#" -gt 0 ]; do
  case "$1" in
    --start-all|-s)
      START_ALL=true
      shift
      ;;
    *)
      echo "Unknown option: $1" >&2
      echo "Usage: $0 [--start-all|-s]" >&2
      exit 1
      ;;
  esac
done

# Ensure volume directories have correct ownership for containers running as non-root
VOLUME_DIR="/mnt/sdcard/homelab-volumes"

for dir in "$VOLUME_DIR"/*; do
  if [ -d "$dir" ]; then
    chown -R 1000:1000 "$dir" 2>/dev/null || true
  fi
done
echo "Ensured volume directories have correct ownership (1000:1000)"

# Start all docker-compose services if requested
if [ "$START_ALL" = true ]; then
  echo "Starting all docker-compose services..."
  for compose_file in /opt/docker/docker-compose.*.yaml; do
    if [ -f "$compose_file" ]; then
      echo "Bringing up $compose_file"
      docker compose -f "$compose_file" up -d
    fi
  done
  echo "All services started"
fi
