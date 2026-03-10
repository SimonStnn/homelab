# Tailscale Serve — HTTPS for Homelab Services

All services on `radxa-e25` are exposed over HTTPS via `tailscale serve`. Tailscale handles TLS certificates automatically (Let's Encrypt) for the Tailscale hostname — no manual cert management needed.

## Service URLs

| Service | URL |
|---------|-----|
| Homepage | `https://radxa-e25.tail539c2b.ts.net` |
| FileBrowser | `https://radxa-e25.tail539c2b.ts.net:8080` |
| OpenWebUI | `https://radxa-e25.tail539c2b.ts.net:8090` |
| Portainer | `https://radxa-e25.tail539c2b.ts.net:9000` |
| Docs | `https://radxa-e25.tail539c2b.ts.net:7300` |
| OpenCode | `https://radxa-e25.tail539c2b.ts.net:4096` |

## Setup

Run the setup script once. The config persists across reboots in Tailscale's state:

```bash
./scripts/tailscale-serve-setup.sh
```

## Managing the Config

```bash
# View current listeners
tailscale serve status

# Reset all listeners (then re-run setup script)
tailscale serve reset

# Remove a specific listener
tailscale serve --https=8080 off
```

## Adding a New Service

Add a new line to `scripts/tailscale-serve-setup.sh`:

```bash
tailscale serve --bg --https=<port> http://localhost:<port>
```

Then re-run the setup script (it resets first, then re-applies everything).

## Notes

- **No subdomains**: Tailscale only issues certs for the exact machine hostname (`radxa-e25.tail539c2b.ts.net`), not wildcards. Access is port-based.
- **Portainer on 9000**: Tailscale serve wraps port 9000 (HTTP) with TLS. Portainer's own HTTPS at 9443 continues to work as well.
- **No extra containers**: `tailscale serve` is built into the Tailscale daemon — nothing to install.
- **Firewall**: Services are only reachable by devices on your Tailnet. `tailscale funnel` would be needed to expose them publicly (not recommended for homelab).
