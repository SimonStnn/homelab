# AGENTS.md - Homelab Configuration

## Overview

This repository contains configurations for a self-hosted homelab.

## Setup

```bash
# Initial setup (creates symlinks and Docker network)
./setup.sh

# Toggle SD card mount
./toggle-sdcard.sh
```

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
- Keep `.env` values out of version control (already in `.gitignore`)
- Use consistent naming: lowercase with hyphens for filenames

### Git Conventions

- Commit messages: short description, blank line, longer explanation if needed
- Don't commit `.env` files or sensitive data
- The `.gitignore` already excludes `.env` and volume directories
