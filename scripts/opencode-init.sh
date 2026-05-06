#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVICE_FILE="$SCRIPT_DIR/opencode.service"
SYSTEMD_DIR="/etc/systemd/system"

echo "Setting up OpenCode systemd service..."

if [ ! -f "$SERVICE_FILE" ]; then
  echo "Error: Service file not found at $SERVICE_FILE"
  exit 1
fi

if [ ! -x "/root/.opencode/bin/opencode" ]; then
  echo "Error: OpenCode binary not found at /root/.opencode/bin/opencode"
  exit 1
fi

echo "Copying service file..."
cp "$SERVICE_FILE" "$SYSTEMD_DIR/opencode.service"

echo "Reloading systemd daemon..."
systemctl daemon-reload

echo "Enabling OpenCode service..."
systemctl enable opencode

echo "Starting OpenCode service..."
systemctl start opencode

echo ""
echo "Checking status..."
sleep 2
systemctl status opencode --no-pager

echo ""
echo "OpenCode is running at http://localhost:4096"
