# Docker Networks

This page documents the Docker networks used by the homelab services.

## pve-local

- Type: external Docker network
- Driver: `bridge`
- Scope: `local`
- Purpose: shared service network for host/LAN access and container communication
- Used by:
  - `dockge/`
  - `homepage/`
  - `uptime-kuma/`

## Notes

- `pve-local` is created and managed outside the individual Compose files.
- Compose stacks that declare `external: true` rely on this network being present before startup.
- Services without an explicit `networks:` section use Docker's default bridge network.
- Confirm the network exists with:

```bash
docker network ls | grep pve-local
```

- If `pve-local` is missing, create it with:

```bash
docker network create pve-local
```
