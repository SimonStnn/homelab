# Nextcloud

Find documentation at [the Nextcloud website](https://nextcloud.com/).

- Location: `nextcloud/`
- Images: `mariadb:10.11` and `nextcloud:latest`
- Port: `8888`
- Network: [`pve-local`](../networks)
- Purpose: self-hosted file sync, sharing, and collaboration platform
- Data volumes: `nextcloud/nextcloud_data/`, `nextcloud/nextcloud_db/`
- Database: MariaDB container managed by Compose
