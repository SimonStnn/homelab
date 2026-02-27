# OpenCode Systemd Service

Run OpenCode as a systemd service for automatic startup on boot and persistent access.

## Requirements

- OpenCode installed at `/root/.opencode/bin/opencode`
- Port `4096` available

## Installation

Run the initialization script:

```bash
./scripts/opencode-init.sh
```

Or manually:

```bash
sudo cp /opt/docker/opencode.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable opencode
sudo systemctl start opencode
```

## Configuration

The service uses these defaults:

| Setting | Value |
|---------|-------|
| Binary | `/root/.opencode/bin/opencode` |
| Port | `4096` |
| Hostname | `0.0.0.0` (all interfaces) |
| Workspace | `/mnt/sdcard/opencode` |

## Usage

```bash
# Start the service
sudo systemctl start opencode

# Stop the service
sudo systemctl stop opencode

# Restart the service
sudo systemctl restart opencode

# Check status
sudo systemctl status opencode

# View logs
sudo journalctl -u opencode -f
```

## Access

OpenCode web interface: **http://localhost:4096**

## Uninstall

```bash
sudo systemctl stop opencode
sudo systemctl disable opencode
sudo rm /etc/systemd/system/opencode.service
sudo systemctl daemon-reload
```
