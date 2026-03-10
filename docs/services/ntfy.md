# ntfy

Self-hosted notification server. Allows sending and subscribing to notifications via HTTP.

## Requirements

- Docker and Docker Compose
- SD card mounted at `/mnt/sdcard`
- Port `8085` available

## Installation

```bash
docker compose -f docker-compose.ntfy.yaml up -d
```

## Access

| URL | Description |
|-----|-------------|
| http://localhost:8085 | Web UI |

## Usage

### Publishing Notifications

```bash
# Using curl
curl -d "Server is down!" http://localhost:8085/my-topic

# From another container (using Docker network)
curl -d "Alert!" http://ntfy:80/my-topic
```

### Subscribing

1. Open http://localhost:8085
2. Click on a topic to subscribe
3. Or use the ntfy mobile app with server URL `http://<your-ip>:8085`

## Volumes

- `/mnt/sdcard/homelab-volumes/ntfy` - ntfy data storage (attachments, message history)

## Integrations

Uptime Kuma can send notifications via ntfy. In Uptime Kuma:
1. Settings → Notifications → Add Notification
2. Select **ntfy**
3. URL: `http://ntfy:80` (internal) or `http://localhost:8085` (external)

## Uninstall

```bash
docker compose -f docker-compose.ntfy.yaml down
```
