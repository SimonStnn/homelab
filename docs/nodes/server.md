# Server node

Refer to the [Docker documentation](docs/docker/README.md) for details on the services running on this node, including: [cAdvisor](docs/docker/services/cadvisor.md), [dockge](docs/docker/services/dockge.md), [homepage](docs/docker/services/homepage.md), [nextcloud](docs/docker/services/nextcloud.md) and [uptime-kuma](docs/docker/services/uptime-kuma.md).

> [!NOTE]
> Visit <https://home.lab/> to access the homepage for this node, which provides links to all services and more!

## Purpose

- Hosts Docker services in `/opt/docker`
- Provides compute, storage, and network for the homelab containers
- Central node for service access and monitoring

## Resources

|                  |                                          |
| ---------------- | ---------------------------------------- |
| OS               | Debian 13                                |
| Cores            | 10                                       |
| Memory           | 24GB                                     |
| Swap             | 512MB                                    |
| Storage Size     | 256GB                                    |
| Storage Location | [`local-lvm`](docs/docker/networks/README.md) |
| Features         | Nesting                                  |

## Network

|              |                            |
| ------------ | -------------------------- |
| Name         | `eth0`                     |
| Bridge       | `vmbr1`                    |
| IPv4 Address | `10.20.30.100/24`          |
| IPv4 Gateway | [`10.20.30.5`](docs/nodes/pi-hole.md) |

## DNS

|            |                                        |
| ---------- | -------------------------------------- |
| Hostname   | `server`                               |
| DNS Domain | *host*                                 |
| DNS server | [`10.20.30.5`](docs/nodes/pi-hole.md) (This node) |

> [!TIP] More documentation
> See [the Docker documentation](docs/docker/README.md) for more information.
