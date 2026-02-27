# File Browser

Web-based file manager for the SD card.

## Requirements

- Docker and Docker Compose
- SD card mounted at `/mnt/sdcard`
- Port `8080` available
- User ID `1000` for file permissions

## Installation

```bash
docker compose -f docker-compose.filebrowser.yaml up -d
```

## Access

Web interface: **http://localhost:8080**

## Default Credentials

Configure on first run via the web interface.

## Volumes

- `/mnt/sdcard/homelab-volumes/filebrowser-data:/database` - Database storage
- `/mnt/sdcard/filebrowser-data:/srv` - File browser root directory

## Permissions

The container runs as user ID 1000. Volume directories must be owned by this user. Run `./scripts/setup.sh` after creating new volume directories to ensure correct ownership.

## Uninstall

```bash
docker compose -f docker-compose.filebrowser.yaml down
```
