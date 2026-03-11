# Uptime Kuma Configuration

## File-based Configuration

Configuration files in `config/uptime-kuma/`:

| File | Description |
|------|-------------|
| `import.json` | JSON template for import/export |
| `configure.sh` | Script to configure via database |

## Notification Setup (Pre-configured)

The ntfy notification is already configured:
- **Server**: http://ntfy:80
- **Topic**: uptime-alerts
- **Priority**: Normal (3)
- **Default**: Yes

This was inserted directly into the database.

## Adding Monitors

### Via UI
1. Go to http://localhost:3001
2. Click "Add New Monitor"
3. Configure:
   - **Type**: HTTP(s)
   - **URL**: e.g., http://homepage:80
   - **Heartbeat Interval**: 60 seconds
   - **Notification**: Select "ntfy"
4. Save

### Via Database (Advanced)
Edit `configure.sh` and run:
```bash
./config/uptime-kuma/configure.sh
```

## Import/Export

### Export
In UI: Settings → Backup/Restore → Export

### Import
In UI: Settings → Backup/Restore → Import JSON

Or use the `import.json` template as a starting point.

## API

Uptime Kuma API is available at `http://localhost:3001/api/`

### Example: Get status
```bash
curl -H "Authorization: <token>" http://localhost:3001/api/status
```

## Docker Volume

- `/mnt/sdcard/homelab-volumes/uptime-kuma` - Database and data
- `kuma.db` - SQLite database (backup this for config backup)
