#!/bin/bash
# Configure tailscale serve to wrap all local services with HTTPS.
# Tailscale handles TLS certificates automatically for radxa-e25.tail539c2b.ts.net.
# This config persists across reboots — run once, or re-run to reset.
set -e

echo "Resetting existing tailscale serve config..."
tailscale serve reset

echo "Configuring HTTPS listeners..."

# Homepage → https://radxa-e25.tail539c2b.ts.net (port 443)
tailscale serve --bg --https=443 http://localhost:80

# FileBrowser → https://radxa-e25.tail539c2b.ts.net:8080
tailscale serve --bg --https=8080 http://localhost:8080

# OpenWebUI → https://radxa-e25.tail539c2b.ts.net:8090
tailscale serve --bg --https=8090 http://localhost:8090

# Portainer → https://radxa-e25.tail539c2b.ts.net:9000
tailscale serve --bg --https=9000 http://localhost:9000

# Docs → https://radxa-e25.tail539c2b.ts.net:7300
tailscale serve --bg --https=7300 http://localhost:7300

# OpenCode → https://radxa-e25.tail539c2b.ts.net:4096
tailscale serve --bg --https=4096 http://localhost:4096

# ntfy → https://radxa-e25.tail539c2b.ts.net:8085
tailscale serve --bg --https=8085 http://localhost:8085

# Uptime Kuma → https://radxa-e25.tail539c2b.ts.net:3001
tailscale serve --bg --https=3001 http://localhost:3001

echo ""
echo "Done. Current config:"
tailscale serve status
