# Server node

Refer to [the Docker documentation](../docker) for details on the services running on this node, including: [cAdvisor](../docker#cadvisor), [Dockge](../docker#dockge), [Homepage](../docker#homepage), [Nextcloud](../docker#nextcloud), and [Uptime Kuma](../docker#uptime-kuma), ….

> [!NOTE]
> Visit <https://home.lab/> to access the homepage for this node, which provides links to all services and more!

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

## DNS

- DNS server: `10.20.30.5` *([Pi-hole](pi-hole.md))*
