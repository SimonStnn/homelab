# Pi-hole Node

On this page, you will find documentation for the Pi-hole node in this homelab. This node provides network-wide ad blocking and DNS filtering, improving your browsing experience and enhancing privacy across all devices on your network.

> [!TIP]
> Visiting <https://dns.lab/> will take you to the Pi-hole dashboard.

## Resources

|                  |                                          |
| ---------------- | ---------------------------------------- |
| OS               | Debian 13                                |
| Cores            | 1                                        |
| Memory           | 512MB                                    |
| Swap             | 512MB                                    |
| Storage Size     | 8GB                                      |
| Storage Location | [`local-lvm`](docs/docker/networks/README.md) |
| Features         | Nesting                                  |

## Network

|              |                 |
| ------------ | --------------- |
| Name         | `eth0`          |
| Bridge       | `vmbr1`         |
| IPv4 Address | `10.20.30.5/24` |
| IPv4 Gateway | `10.20.30.1`    |

## DNS

|            |                                        |
| ---------- | -------------------------------------- |
| Hostname   | `pi-hole`                              |
| DNS Domain | *host*                                 |
| DNS server | [`10.20.30.5`](docs/nodes/pi-hole.md) (This node) |

## Changed settings

### Interface listening behavior

Go to *Settings > DNS* and set "Interface settings" to "Bind only to interface `eth0`". This allows Pi-hole to respond to DNS queries from any device on the network, not just those on the same interface as the container.

> [!DANGER]
> This is dangerous to set, make sure you have proper firewall rules in place to prevent abuse if you allow Pi-hole to listen on all interfaces.

### Conditional forwarding

Go to *Settings > DNS* and set "Conditional forwarding" to forward local network requests to the Proxmox host to:

```
true,10.20.30.0/24,10.20.30.199,ts.net
```

This allows Pi-hole to resolve local hostnames for devices on the network, improving visibility and usability when accessing local services. This is required for setting up the tailscale configuration to use Pi-hole as the DNS server for devices connected through Tailscale. Please refer to [the Tailscale documentation](docs/nodes/tailscale-gateway.md) for more details on this configuration.

## Local DNS settings

Go to *Settings > Local DNS Records* and add records for any local devices or services you want to access by hostname. Below is the current configuration for the local DNS records in this homelab.

### Local DNS records

| Hostname                                    | IP Address     | Comment                                                                      |
| ------------------------------------------- | -------------- | :--------------------------------------------------------------------------- |
| `gateway.lab`                               | `10.20.30.199` | Main network gateway with Tailscale                                          |
| [`proxy.lab`](docs/nodes/nginx-proxy-manager.md) | `10.20.30.10`  | Reverse proxy for local services and will be used by all connecting clients. |

### Local CNAME records

| Hostname                                 | Target          | Ref                                                      | Comment |
| ---------------------------------------- | --------------- | -------------------------------------------------------- | :------ |
| [`cadvisor.lab`](https://cadvisor.lab)   | `proxy.lab`     | [cadvisor](docs/docker/services/cadvisor.md)             | *NA*    |
| [`dashboard.lab`](https://dashboard.lab) | `proxy.lab`     | [homepage](docs/docker/services/homepage.md)             | *NA*    |
| [`dns.lab`](https://dns.lab)             | `proxy.lab`     | [nginx-proxy-manager](docs/nodes/nginx-proxy-manager.md) | *NA*    |
| [`dockge.lab`](https://dockge.lab)       | `proxy.lab`     | [dockge](docs/docker/services/dockge.md)                 | *NA*    |
| [`home.lab`](https://home.lab)           | `dashboard.lab` | [homepage](docs/docker/services/homepage.md)             | *NA*    |
| [`kuma.lab`](https://kuma.lab)           | `proxy.lab`     | [uptime-kuma](docs/docker/services/uptime-kuma.md)       | *NA*    |
| [`nextcloud.lab`](https://nextcloud.lab) | `proxy.lab`     | [nextcloud](docs/docker/services/nextcloud.md)           | *NA*    |
| [`proxmox.lab`](https://proxmox.lab)     | `proxy.lab`     | [host](docs/README.md)                                   | *NA*    |
