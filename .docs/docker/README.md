# Docker Services

This node runs Docker Compose services from `/opt/docker`. Each service is maintained in its own folder with a Compose manifest, service data, and local configuration directories.

## Deployment structure

- Service folder: `/opt/docker/<service>`
- Compose file: `compose.yaml` or `docker-compose.yaml`
- Secret files: `.env` in the service folder
- Shared Docker network: `pve-local`

## Docker networks

- `pve-local` is the external bridge network used by most documented services.
- It is defined on the host and referenced by Compose stacks with `external: true`.
- Services that do not declare a network use Docker's default bridge network.
- See [`networks/README.md`](Docker/Networks/README.md) for full network details.

## Services

- [cadvisor](cadvisor.md)
- [dockge](dockge.md)
- [homepage](homepage.md)
- [nextcloud](nextcloud.md)
- [uptime-kuma](uptime-kuma.md)
### Running services

> [!TIP]
> Go to <https://dockge.lab/> to view and manage your Docker services through the Dockge UI. This is the recommended way to start, stop, and view logs for your services.

```bash
cd /opt/docker/<service-folder>
docker compose up -d
```

If a service folder defines a `.env` file, Compose will load it automatically.

## Secrets handling

- Each service folder may contain a `.env` file
- `.env` files are used for API keys, passwords, and other secrets
- Do not commit `.env` files to Git

## Notes

- The host publishes container ports; verify firewall and reverse proxy configuration before exposing services externally.
- `pve-local` is the shared Docker network used by most services.
- Keep sensitive values in `.env` files and out of Git.
- Consult `.docs/docker/services/` for per-service reference pages.
