# Homelab Documentation

This repository documents my personal homelab for self-hosted services and media. It is written for the owner/maintainer and focuses on architecture, service inventory, network details, and operational notes.

![banner](attachments/banner.jpg)

## Purpose

- Personal services and media hosting
- Self-hosted infrastructure and Docker-based service deployment
- Maintainable documentation for the server node and service details

## Audience

- The maintainer of this homelab
- Anyone who must review or operate the services and network configuration

## Host

|         |                                                      |
| ------- | ---------------------------------------------------- |
| CPU     | 12 cores (Intel(R) Xeon(R) CPU E5-1650 v3 @ 3.50GHz) |
| RAM     | 32 GB                                                |
| Storage | 2×1TB SSD in RAID 1                                  |
| OS      | `6.17.13-2-pve`                                      |

### Proxmox VE

- Version: `9.1.6`

## Nodes

> [!NOTE]
> Explore the documentation for nodes at [the Nodes section](Nodes/README.md).

 ![README](Nodes/README.md)
## Docker services

> [!NOTE]
> Explore the documentation for Docker services at [the Docker section](Docker/README.md).

![README](Docker/README.md)
## Backup plan

> TODO: define and document a backup plan for config and persistent data
