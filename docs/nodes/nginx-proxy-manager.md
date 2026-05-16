# Nginx Proxy Manager Node

On this page, you will find documentation for the Nginx Proxy Manager node in this homelab. This node provides a web-based interface for managing Nginx proxy hosts, streams, and 404 hosts, making it easy to set up and manage reverse proxies for your services.

> [!TIP]
> Visiting <https://proxy.lab/> will take you to the Nginx Proxy Manager dashboard.

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

|              |                  |
| ------------ | ---------------- |
| Name         | `eth0`           |
| Bridge       | `vmbr1`          |
| IPv4 Address | `10.20.30.10/24` |
| IPv4 Gateway | `10.20.30.1`     |

## DNS

- DNS server: [`10.20.30.5`](docs/nodes/pi-hole.md) ([Pi-hole](docs/nodes/pi-hole.md))

## Proxy Hosts

| Proxy Host                               | Scheme | Forwarded Hostname/IP | Forwarded Port | Websockets | SSL            |     Force SSL      | Access | Notes                              |
| ---------------------------------------- | :----: | --------------------: | -------------: | :--------: | -------------- | :----------------: | ------ | :--------------------------------- |
| [`cadvisor.lab`](https://cadvisor.lab)   |  http  |        `10.20.30.100` |         `8080` |     ✖️     | `"*.lab" cert` | :heavy_check_mark: | Public |                                    |
| [`dashboard.lab`](https://dashboard.lab) |  http  |        `10.20.30.100` |           `80` |     ✖️     | `"*.lab" cert` | :heavy_check_mark: | Public |                                    |
| [`home.lab`](https://home.lab)           |  http  |        `10.20.30.100` |           `80` |     ✖️     | `"*.lab" cert` | :heavy_check_mark: | Public |                                    |
| [`dns.lab`](https://dns.lab)             | https  |          `10.20.30.5` |          `443` |     ✖️     | `"*.lab" cert` | :heavy_check_mark: | Public |                                    |
| [`dockge.lab`](https://dockge.lab)       |  http  |        `10.20.30.100` |         `5001` |     ✖️     | `"*.lab" cert` | :heavy_check_mark: | Public |                                    |
| [`kuma.lab`](https://kuma.lab)           |  http  |        `10.20.30.100` |         `3001` |     ✔️     | `"*.lab" cert` | :heavy_check_mark: | Public |                                    |
| [`nextcloud.lab`](https://nextcloud.lab) |  http  |        `10.20.30.100` |         `8888` |     ✔️     | `"*.lab" cert` | :heavy_check_mark: | Public | Set proxy headers in custom rules. |
| [`proxmox.lab`](https://proxmox.lab)     | https  |          `10.20.30.1` |         `8006` |     ✖️     | `"*.lab" cert` | :heavy_check_mark: | Public |                                    |
| [`proxy.lab`](https://proxy.lab)         |  http  |         `10.20.30.10` |           `81` |     ✖️     | `"*.lab" cert` | :heavy_check_mark: | Public |                                    |

## Certificates

| Name           | Domain(s) | Expires    | Notes                                                        |
| -------------- | --------- | ---------- | ------------------------------------------------------------ |
| `"*.lab" cert` | `*.lab`   | 2036-05-04 | Issued by Let's Encrypt, used for all hosts in this homelab. |
<!-- May the fourth be with you. -->
