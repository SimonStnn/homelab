# Portainer

Docker container management UI.

## Requirements

- Docker and Docker Compose
- SD card mounted at `/mnt/sdcard`
- Ports `9000` and `9443` available

## Installation

```bash
docker compose -f docker-compose.portainer.yaml up -d
```

## Access

| URL | Description |
|-----|-------------|
| http://localhost:9000 | HTTP interface |
| https://localhost:9443 | HTTPS interface |

## First Setup

1. Create an admin user on first access
2. Connect to the local Docker socket

## Volumes

- `/mnt/sdcard/homelab-volumes/portainer:/data` - Portainer data storage
- `/var/run/docker.sock` - Docker socket (read-only)

## Uninstall

```bash
docker compose -f docker-compose.portainer.yaml down
```
