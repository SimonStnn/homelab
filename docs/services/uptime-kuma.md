# Uptime Kuma

Self-hosted monitoring tool for tracking uptime and status of services.

## Requirements

- Docker and Docker Compose
- SD card mounted at `/mnt/sdcard`
- Port `3001` available
- ntfy running (for notifications)

## Installation

```bash
docker compose -f docker-compose.uptime-kuma.yaml up -d
```

## Access

| URL | Description |
|-----|-------------|
| http://localhost:3001 | Web UI |

## First Setup

1. Create an admin user on first access
2. Add monitors for your services

## Adding a Monitor

1. Click **Add New Monitor**
2. Fill in:
   - **Monitor Type**: HTTP(s) / TCP / Ping / etc.
   - **URL**: The service to monitor (e.g., http://homepage:80)
   - **Heartbeat Interval**: How often to check (default: 60 seconds)
   - **Retries**: Number of failures before alerting
3. Save

## Notifications (ntfy)

1. Go to **Settings → Notifications → Add Notification**
2. Select **ntfy** from the list
3. Configure:
   - **Notification Type**: ntfy
   - **ntfy Server URL**: `http://ntfy:80` (internal) or `http://localhost:8085` (external)
   - **Topic**: e.g., `uptime-alerts`
4. Test the notification
5. Save

## Subscribing to Alerts

1. Open ntfy web UI at http://localhost:8085
2. Subscribe to the topic you configured (e.g., `uptime-alerts`)
3. Or use the ntfy mobile app

## Volumes

- `/mnt/sdcard/homelab-volumes/uptime-kuma` - Uptime Kuma data storage

## Common Monitor Types

| Type | Use Case |
|------|----------|
| HTTP(s) | Web services, APIs |
| TCP | Databases, custom services |
| Ping | Device availability |
| DNS | DNS server monitoring |
| Push | For services that can't be reached directly (push heartbeat) |

## Uninstall

```bash
docker compose -f docker-compose.uptime-kuma.yaml down
```
