# Tailscale gateway node

On this page, you will find documentation for the Tailscale gateway node in this homelab. This node provides a secure VPN gateway for remote access to the homelab network, allowing you to connect to your services from anywhere with an internet connection.

## Resources

- OS: Debian 13
- Cores: 1
- Memory: 512MB
- Swap: 512MB
- Storage:
  - Size: 4GB
  - Location: `local-lvm`
- Features:
  - Nesting

## Network

- Name: `eth0`
- Bridge: `vmbr1`
- IPv4 Address: `10.20.30.199/24`
- IPv4 Gateway: `10.20.30.1`

## DNS

- DNS server: `10.20.30.5` *([Pi-hole](pi-hole.md))*

## Setup

1. Install Tailscale on the node by following the [official installation instructions](https://tailscale.com/download).
1. Run the following command to start the Tailscale service and connect to the network.

   ```bash
   tailscale up --advertise-routes=10.20.30.0/24
   ```

1. Go to the [Tailscale admin console](https://login.tailscale.com/admin/machines) and authorize the new node to join the network.
   1. Go to <https://login.tailscale.com/admin/machines>
   2. Find the new node in the list of machines
   3. Click the "Authorize" button next to the node to allow it to connect to the network
1. Now check if you can ping for example to the Pi-hole node from your local machine that is also connected to the Tailscale network.

   ```bash
   ping 10.20.30.5
   ```

## Conclusion

With the Tailscale gateway node set up, you can now securely access your homelab network from anywhere. This allows you to manage your services and access your data without needing to be physically present in your home network.
