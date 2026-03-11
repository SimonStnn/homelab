# Tailscale Skill (Passive)

Manage Tailscale HTTPS serving for exposing homelab services.

## Behavior

This skill runs **passively** - it monitors for new docker-compose services and automatically adds them to the Tailscale serve configuration. Also provides active management commands.

## How It Works

1. **Detect new service:** When a new `docker-compose.<service>.yaml` is added
2. **Extract port:** Parse the compose file for exposed ports
3. **Add to serve:** Run `tailscale serve --bg --https=<port> http://localhost:<port>`

## Configuration

- **Setup script:** `scripts/tailscale-serve-setup.sh`
- **Port range:** Uses Tailscale's built-in HTTPS serving (ports 443, 8080+)
- **Hostname:** `radxa-e25.tail539c2b.ts.net`

## Existing Port Mappings

| External Port | Local Port | Service |
|---------------|------------|---------|
| 443 | 80 | homepage |
| 8080 | 8080 | filebrowser |
| 8090 | 8090 | openwebui |
| 9000 | 9000 | portainer |
| 7300 | 7300 | docs |
| 4096 | 4096 | opencode |
| 8085 | 8085 | ntfy |
| 3001 | 3001 | uptime-kuma |

## Commands

### status
Show current Tailscale serve status.
```
tailscale serve status
```
plays all activeDis port mappings.

### add <port>
Add a new service to Tailscale serve.
```
tailscale serve --bg --https=<port> http://localhost:<port>
```

### remove <port>
Remove a service from Tailscale serve.
```
tailscale serve --https=<port> off
```

### reset
Remove all Tailscale serve configurations.
```
tailscale serve reset
```

### apply
Apply the configuration from `scripts/tailscale-serve-setup.sh`.
```
./scripts/tailscale-serve-setup.sh
```

### check
Check for services missing Tailscale serve config.
```
Compare:
- docker-compose.*.yaml exposed ports
- Current tailscale serve status
```

### reload
Regenerate and apply Tailscale serve configuration.
```
1. Parse all docker-compose.*.yaml files for exposed ports
2. Update scripts/tailscale-serve-setup.sh
3. Run tailscale serve reset
4. Run tailscale serve apply
```

## Port Assignment Rules

- Ports 80, 443: Reserved for primary services (homepage)
- Ports 8080-9999: Available for other services
- Each service gets its container port mapped directly

## Examples

After adding `docker-compose.myservice.yaml` with port 8081:
- Auto-detect new port 8081
- Add to tailscale-serve-setup.sh: `tailscale serve --bg --https=8081 http://localhost:8081`
- Apply configuration

After removing a service:
- Remove corresponding tailscale serve line
- Run `tailscale serve <port> off`

## Passive Triggers

Automatically triggers when:
- New docker-compose service added
- New port exposed in existing compose file
- Service removed (suggests removing tailscale config)
