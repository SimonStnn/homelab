# cAdvisor Service

Find documentation at [the cAdvisor github repository](https://github.com/google/cadvisor).

- Location: `cadvisor/`
- Image: `gcr.io/cadvisor/cadvisor:latest`
- Port: `8080`
- Network: [`pve-local`](docs/docker/networks/README.md)
- Purpose: host/container resource monitoring and metrics collection
- Notes: uses host mounts and privileged access for container metrics
