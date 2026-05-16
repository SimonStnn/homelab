# Homepage

Find documentation at [the gethomepage website](https://gethomepage.dev/).

- Location: `homepage/`
- Image: `ghcr.io/gethomepage/homepage:latest`
- Port: `80`
- Network: [`pve-local`](docs/docker/networks/README.md)
- Purpose: personalized homepage/start page for home and service links
- Config: `homepage/homepage-config/`
- Network: `pve-local`
- Env vars: `HOMEPAGE_ALLOWED_HOSTS`, `HOMEPAGE_VAR_*` for service integration
