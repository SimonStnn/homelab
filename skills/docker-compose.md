# Docker Compose Skill

Manage Docker Compose services for this homelab.

## Available Services

| Service | Compose File | Ports |
|---------|--------------|-------|
| homepage | docker-compose.homepage.yaml | 80 |
| portainer | docker-compose.portainer.yaml | 9000, 9443 |
| filebrowser | docker-compose.filebrowser.yaml | 8080 |
| openwebui | docker-compose.openwebui.yaml | 8090 |
| ntfy | docker-compose.ntfy.yaml | |
| uptime-kuma | docker-compose.uptime-kuma.yaml | |
| docs | docker-compose.docs.yaml | |

## Commands

### start <service>
Start a Docker Compose service.
```
docker compose -f docker-compose.<service>.yaml up -d
```

### stop <service>
Stop a Docker Compose service.
```
docker compose -f docker-compose.<service>.yaml down
```

### restart <service>
Restart a Docker Compose service (stop + start).
```
docker compose -f docker-compose.<service>.yaml down
docker compose -f docker-compose.<service>.yaml up -d
```

### ps
List all compose services and their status.
```
docker compose -f docker-compose.<service>.yaml ps
```
Run for all known services and display aggregated status.

### logs <service>
View logs for a service (last 50 lines).
```
docker compose -f docker-compose.<service>.yaml logs --tail=50
```

### stats
Show real-time container resource usage.
```
docker stats --no-stream
```

### prune
Clean up unused containers, networks, and dangling images.
```
docker container prune -f
docker network prune -f
docker image prune -f
```

### inspect <service>
Show detailed container information.
```
docker inspect <container_name>
```
Container names: homepage, portainer, filebrowser, openwebui, ntfy, uptime-kuma, docs

## Examples

- Start homepage: `start homepage`
- Stop portainer: `stop portainer`
- View openwebui logs: `logs openwebui`
- Check all container stats: `stats`
- Clean up unused resources: `prune`
