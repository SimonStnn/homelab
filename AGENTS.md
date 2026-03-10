# AGENTS.md - Homelab Configuration

## Overview

This repository contains configurations for a self-hosted homelab.

## Setup

```bash
# Initial setup (creates symlinks and Docker network)
./setup.sh

# Toggle SD card mount
./toggle-sdcard.sh

# Setup OpenCode as systemd service (always-on)
./scripts/opencode-init.sh
```

## Infrastructure

### OpenCode

Run as systemd service for always-on availability:

- Service file: `opencode.service`
- Init script: `scripts/opencode-init.sh`
- Documentation: `docs/infrastructure/opencode.md`

```bash
# Manual commands
systemctl start opencode
systemctl stop opencode
systemctl status opencode
journalctl -u opencode -f
```

## Docker Services

### Homepage

Docker Compose: `docker-compose.homepage.yaml`
- Port: 80
- Documentation: `docs/services/homepage.md`

### Portainer

Docker Compose: `docker-compose.portainer.yaml`
- Ports: 9000, 9443
- Documentation: `docs/services/portainer.md`

### File Browser

Docker Compose: `docker-compose.filebrowser.yaml`
- Port: 8080
- Documentation: `docs/services/filebrowser.md`

### Open WebUI

Docker Compose: `docker-compose.openwebui.yaml`
- Port: 8090
- Documentation: `docs/services/openwebui.md`

## Code Style Guidelines

### Shell Scripts

- Use `#!/bin/bash` shebang
- Use `set -e` for error handling when appropriate
- Use `$(command)` for command substitution (not backticks)
- Quote paths: `"$VAR"` not `$VAR`
- Use `local` for function variables
- Check exit codes: `if [ $? -eq 0 ]`
- Use descriptive variable names: `MOUNT_POINT`, `DEVICE`

### General Patterns

- Keep configuration files modular
- Use comments to explain non-obvious configurations
- Keep `.env` values out of version control
- Use consistent naming: lowercase with hyphens for filenames

## Documentation

- Write documentation for every feature or service successfully implemented
- Maintain existing documentation when making changes
- Use `docs/` directory for documentation files
- Documentation should cover: installation, configuration, usage, and uninstall steps

## Skills

Available skills in `skills/` directory:

- **docker-compose.md** - Manage Docker Compose services (start, stop, restart, logs, stats, prune, inspect)
- **file-management.md** - File/directory operations (list, size, find, permissions, create-dir, copy, move)
- **documentation.md** - Passive skill that auto-documents implementations
- **homepage.md** - Passive skill that auto-adds Homepage widgets for new services
- **tailscale.md** - Passive skill that auto-configures Tailscale HTTPS serving for new services

## Git Conventions

- Commit messages: short description, blank line, longer explanation if needed
- Don't commit `.env` files or sensitive data
- The `.gitignore` already excludes `.env` and volume directories
