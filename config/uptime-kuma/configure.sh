#!/bin/bash
# Uptime Kuma configuration script
# Adds ntfy notification and basic monitors

set -e

KUMA_DB="/mnt/sdcard/homelab-volumes/uptime-kuma/kuma.db"

if [ ! -f "$KUMA_DB" ]; then
    echo "Error: Uptime Kuma database not found at $KUMA_DB"
    exit 1
fi

echo "Adding ntfy notification..."
sqlite3 "$KUMA_DB" "INSERT OR REPLACE INTO notification (name, active, user_id, is_default, config) VALUES ('ntfy', 1, 1, 1, '{\"ntfyServerURL\":\"http://ntfy:80\",\"ntfyTopic\":\"uptime-alerts\",\"ntfyPriority\":3}');"

echo "Adding monitor for Homepage..."
sqlite3 "$KUMA_DB" "INSERT INTO monitor (name, url, type, interval, retry_interval, keyword, invertkeyword, timeout, maxretries, notification_id, active, user_id) VALUES ('Homepage', 'http://homepage:80', 'http', 60, 0, '', 0, 30, 0, 1, 1, 1);"

echo "Adding monitor for Portainer..."
sqlite3 "$KUMA_DB" "INSERT INTO monitor (name, url, type, interval, retry_interval, keyword, invertkeyword, timeout, maxretries, notification_id, active, user_id) VALUES ('Portainer', 'http://portainer:9000', 'http', 60, 0, '', 0, 30, 0, 1, 1, 1);"

echo "Adding monitor for ntfy..."
sqlite3 "$KUMA_DB" "INSERT INTO monitor (name, url, type, interval, retry_interval, keyword, invertkeyword, timeout, maxretries, notification_id, active, user_id) VALUES ('ntfy', 'http://ntfy:80', 'http', 60, 0, '', 0, 30, 0, 1, 1, 1);"

echo "Done! Uptime Kuma configured with ntfy notification and basic monitors."
