# Copilot Instructions - Docker Homelab Infrastructure

## Project Overview
This is a Docker-based homelab infrastructure with modular service deployments. Each service has its own docker-compose file for independent lifecycle management while sharing a common `homelab` network.

## Architecture & Service Structure

### Service Isolation Pattern
- **One service per compose file**: `docker-compose.<service>.yaml` format
- Each service is independently deployable and manageable
- All services connect to the shared `homelab` bridge network (external)
- Volumes are external and pre-initialized via `.docker-compose.yaml`

### Core Services
- **homepage** - Dashboard and service aggregator (port 80)
- **portainer** - Container management UI (port 9000)
- **n8n** - Workflow automation with PostgreSQL backend (port 5678)
- **heimdall** - Application dashboard (port 80)

### Network & Volume Initialization
The `.docker-compose.yaml` file creates shared infrastructure:
- External volumes: `heimdall-config`, `portainer_data`, `n8n-data`, `n8n-postgres-data`
- External network: `homelab` (bridge driver)
- Volumes must be created before deploying services

## Developer Workflows

### Starting Services
```bash
# Initialize volumes and network FIRST
docker compose -f .docker-compose.yaml up -d

# Then start individual services
docker compose -f docker-compose.homepage.yaml up -d
docker compose -f docker-compose.portainer.yaml up -d
docker compose -f docker-compose.n8n.yaml up -d
```

### Managing Services
```bash
# View logs for a specific service
docker logs --tail 1000 -f <container-name>

# Restart a service
docker compose -f docker-compose.<service>.yaml restart

# Stop without removing
docker compose -f docker-compose.<service>.yaml stop
```

## Project Conventions

### Environment Configuration
- Sensitive values in `.env` and `.env.homepage` files (gitignored)
- Template variables in homepage config: `{{HOMEPAGE_VAR_PORTAINER_API_KEY}}`
- Timezone consistently set to `Europe/Brussels` across all services

### Port Publishing Pattern
All services use explicit port configuration with `mode: host`:
```yaml
ports:
  - target: <container-port>
    published: <host-port>
    protocol: tcp
    mode: host
```

### Healthchecks
Services include healthchecks with 120s intervals:
- n8n: `/healthz` endpoint check
- PostgreSQL: `pg_isready` command
- heimdall: netcat port check

## Homepage Dashboard Integration

### Adding Services to Dashboard
1. Update `homepage/services.yaml` with service metadata
2. Group services logically (Management, Automation, Infrastructure)
3. Link to container via `server: my-docker` + `container: <name>`
4. Widget configuration for service-specific metrics

### Homepage Configuration Files
- `services.yaml` - Service cards and widget configuration
- `docker.yaml` - Docker socket connection (`my-docker` server)
- `widgets.yaml` - Dashboard-level widgets (resources, search)
- `settings.yaml` - API keys for external providers
- `bookmarks.yaml` - Quick link bookmarks (optional)

### Docker Socket Integration
Homepage has read-only access to `/var/run/docker.sock` for container status monitoring.

## Important Notes

- Services use LinuxServer.io and official images (`ghcr.io/linuxserver/*`, official repos)
- User/group set to `1000:1000` (PUID/PGID) for file permissions
- `restart: unless-stopped` policy on all production services
- Tailscale integration visible in hostname: `radxa-e25.tail539c2b.ts.net`
- When modifying n8n: keep PostgreSQL credentials synchronized between `postgres` and `n8n` services
