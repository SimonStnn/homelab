# Homelab Nodes

This folder documents the physical and virtual nodes that make up the homelab.
Each node has its own purpose, network address, and service role.

## Nodes included

- [`server`](docs/nodes/server.md) — main Docker node hosting most homelab services.
- [`nginx-proxy-manager`](docs/nodes/nginx-proxy-manager.md) — reverse proxy and SSL manager for service routing.
- [`pi-hole`](docs/nodes/pi-hole.md) — DNS and network-wide ad blocking.
- [`tailscale-gateway`](docs/nodes/tailscale-gateway.md) — remote access gateway for secure homelab connectivity.

## Why this matters

- Keeps infrastructure details separated by node.
- Makes it easier to understand where services run and how traffic flows.
- Centralizes network addresses, DNS behavior, and node-specific settings.

## How to use this directory

1. Start with this overview.
2. Open the node document that matches the machine you want to inspect.
3. Use the network and DNS sections to track connectivity and access points.

## Notes

- The `server` node is the main service host and contains the Docker Compose stack.
- The proxy node handles incoming HTTP/HTTPS routing for local hostnames.
- The Pi-hole node is the primary DNS source for the homelab network.
- The Tailscale gateway node provides secure remote access without exposing services directly.
