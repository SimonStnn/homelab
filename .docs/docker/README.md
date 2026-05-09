# Docker Services

## Overview

This homelab is organized into individual service folders. Each folder contains a Docker Compose manifest and local configuration volumes where required. The file structure allows for [Dockge](dockge.md) to scan and manage the services as Docker stacks, while keeping configuration and data organized.

The current service set includes:

- [`cadvisor/`](cadvisor.md) — Container metrics and resource monitoring
- [`dockge/`](dockge.md) — Docker stack browser and manager
- [`homepage/`](homepage.md) — Custom homepage / start page
- [`nextcloud/`](nextcloud.md) — Nextcloud self-hosted file sync and collaboration
- [`uptime-kuma/`](uptime-kuma.md) — Uptime and service monitoring

## Usage

> [!TIP]
> Go to <https://dockge.lab/> to view and manage your Docker services through the Dockge UI. This is the recommended way to start, stop, and view logs for your services.

Run individual services from their folder:

```bash
cd /opt/docker/<service-folder>
docker compose up -d
```

If a service uses environment variables, define them in a `.env` file in the same folder or export them before starting Compose.

### Example

```bash
cd /opt/docker/homepage
docker compose up -d
```

## Notes

- `pve-local` is used as an external Docker network for services that need access to other host or LAN services.
- Keep sensitive environment values out of version control and store them in `.env` files or a secure secret store.
- For any service that exposes a port, verify firewall and reverse proxy configuration if you publish it externally.
