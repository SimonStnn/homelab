# Homepage

A modern, static homepage for your homelab.

## Requirements

- Docker and Docker Compose
- SD card mounted at `/mnt/sdcard`
- Port `80` available

## Installation

```bash
docker compose -f docker-compose.homepage.yaml up -d
```

## Configuration

Configuration files are stored in `./homepage/`.

### Environment Variables

| Variable | Description |
|----------|-------------|
| `HOMEPAGE_ALLOWED_HOSTS` | Allowed hostnames (Tailnet hostname for remote access) |
| `HOMEPAGE_VAR_RADXA_PORTAINER_API_KEY` | Portainer API key |
| `HOMEPAGE_VAR_BITWARDEN_URL` | Bitwarden instance URL |

## Access

Web interface: **http://localhost:80**

## Volumes

- `./homepage:/app/config` - Configuration files
- `/mnt/sdcard:/mnt/sdcard:ro` - SD card read-only access

## Uninstall

```bash
docker compose -f docker-compose.homepage.yaml down
```
