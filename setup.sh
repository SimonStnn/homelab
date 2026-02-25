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
