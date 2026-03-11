# Obsidian

Obsidian is a note-taking and knowledge base application. This service runs the LinuxServer.io Docker image, which wraps Obsidian in a KasmVNC browser-accessible GUI.

- **Image**: `lscr.io/linuxserver/obsidian:latest`
- **URL**: `https://radxa-e25.tail539c2b.ts.net:3010/`
- **Compose file**: `docker-compose.obsidian.yaml`

## Installation

```bash
# Start the service
docker compose -f docker-compose.obsidian.yaml up -d

# Add Tailscale HTTPS serving (re-run the setup script)
./scripts/tailscale-serve-setup.sh
```

## Configuration

| Variable | Value |
|----------|-------|
| `PUID` | `1000` |
| `PGID` | `1000` |
| `TZ` | `Europe/Brussels` |
| Host port | `3010` |
| Container port | `3000` (KasmVNC HTTP) |

### Volumes

| Host path | Container path | Purpose |
|-----------|----------------|---------|
| `/mnt/sdcard/homelab-volumes/obsidian` | `/config` | App config, settings, and vaults |

## Usage

1. Open `https://radxa-e25.tail539c2b.ts.net:3010/` in your browser
2. The KasmVNC interface loads Obsidian in the browser
3. Vaults are stored inside `/config` (persisted in the volume)

## Uninstall

```bash
# Stop and remove the container
docker compose -f docker-compose.obsidian.yaml down

# Remove the volume data (irreversible — backup first)
rm -rf /mnt/sdcard/homelab-volumes/obsidian
```
