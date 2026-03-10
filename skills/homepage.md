# Homepage Update Skill (Passive)

Automatically manage Homepage dashboard widgets when new services are added.

## Behavior

This skill runs **passively** - it monitors for new docker-compose services and automatically adds corresponding widgets to the Homepage dashboard.

## How It Works

1. **Detect new service:** When a new `docker-compose.<service>.yaml` file is added to `/opt/docker/`
2. **Extract info:** Parse the compose file for:
   - Service name
   - Exposed ports
   - Container name
   - Image used
3. **Add widget:** Create entry in `config/homepage/services.yaml`

## Configuration

- **Dashboard config:** `config/homepage/services.yaml`
- **Category:** Services are added to "Homelab" category by default
- **External access URL:** Uses Tailscale URL pattern: `https://radxa-e25.tail539c2b.ts.net:<port>/`

## Commands

### reload
Reload Homepage configuration without restarting containers.
```
docker exec homepage sh -c 'kill -HUP 1'
```
or
```
touch /app/config/config.yaml
```
Homepage auto-reloads config changes.

### check
Check for new services without added widgets.
```
Compare:
- docker-compose.*.yaml files in /opt/docker
- Services already in config/homepage/services.yaml
```

### status
Show Homepage widget coverage summary.
```
Lists:
- Services with widgets
- Services missing widgets
- Docker integration status
```

### add-widget <service>
Manually add a widget for a specific service.
```
Parses docker-compose.<service>.yaml
Adds entry to config/homepage/services.yaml
```

### remove-widget <service>
Remove a widget from Homepage.
```
Removes entry from config/homepage/services.yaml
```

## Widget Template

When adding a new service widget:

```yaml
- Homelab:
    - ServiceName:
        icon: <service>.png  # optional, place in /config/homepage/icons/
        href: https://radxa-e25.tail539c2b.ts.net:<port>/
        description: <service description>
        server: my-docker
        container: <container-name>
        siteMonitor: https://radxa-e25.tail539c2b.ts.net:<port>/health
```

## Examples

After creating `docker-compose.myservice.yaml`:
- Auto-add widget with port 8080, container "myservice"
- Creates entry in Homelab category

After running `docker compose -f docker-compose.newservice.yaml up -d`:
- Detect new service
- Add to services.yaml
- Touch config to reload

## Existing Services

Current docker-compose services:
- homepage
- portainer
- filebrowser
- openwebui
- ntfy
- uptime-kuma
- docs
