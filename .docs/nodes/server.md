# Server node

Refer to [the Docker documentation](../docker) for details on the services running on this node, including: [cAdvisor](../docker#cadvisor), [Dockge](../docker#dockge), [Homepage](../docker#homepage), [Nextcloud](../docker#nextcloud), and [Uptime Kuma](../docker#uptime-kuma).

> [!NOTE]
> Visit <https://home.lab/> to access the homepage for this node, which provides links to all services and more!

## Purpose

- Hosts Docker services in `/opt/docker`
- Provides compute, storage, and network for the homelab containers
- Central node for service access and monitoring

## Resources

- OS: Debian 13
- Cores: 10
- Memory: 24GB
- Swap: 512MB
- Storage:
  - Size: 256GB
  - Location: `local-lvm`
- Features:
  - Nesting

## Network

- Name: `eth0`
- Bridge: `vmbr1`
- IPv4 Address: `10.20.30.100/24`
- IPv4 Gateway: `10.20.30.5` *([Pi-hole](pi-hole.md))*
- DNS: `10.20.30.5` *([Pi-hole](pi-hole.md))*

## Docker architecture

- Services deployed with Docker Compose under `/opt/docker`
- Shared external Docker network: `pve-local`
- Published host ports provide container access from the LAN
- Secrets are managed per-service in `.env` files
