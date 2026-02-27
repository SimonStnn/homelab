# Open WebUI

User interface for interacting with Ollama LLMs.

## Requirements

- Docker and Docker Compose
- Ollama instance accessible
- Port `8090` available

## Installation

```bash
docker compose -f docker-compose.openwebui.yaml up -d
```

## Configuration

| Environment Variable | Description |
|---------------------|-------------|
| `TZ` | Timezone (Europe/Brussels) |
| `OLLAMA_BASE_URL` | Ollama server URL |

Current Ollama endpoint: `http://edge-ai-11.tail539c2b.ts.net:11434`

## Access

Web interface: **http://localhost:8090**

## Volumes

- `/mnt/sdcard/homelab-volumes/open-webui:/app/backend/data` - Application data

## Uninstall

```bash
docker compose -f docker-compose.openwebui.yaml down
```
