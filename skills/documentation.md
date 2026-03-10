# Documentation Skill (Passive)

Automatically document everything implemented in this homelab.

## Behavior

This skill runs **passively** - it automatically creates or updates documentation after any implementation task.

## Triggers

After any of these actions, automatically create/update documentation:
- New docker-compose service added
- New script created
- New configuration file added
- Existing service modified
- Infrastructure changes

## Documentation Rules

1. **Location:** All docs go in `docs/` directory
2. **Service docs:** `docs/services/<service-name>.md`
3. **Infrastructure docs:** `docs/infrastructure/<topic>.md`
4. **Format:** Include these sections:
   - Description (what it does)
   - Installation
   - Configuration
   - Usage
   - Uninstall steps

## Commands

### check
Audit existing documentation for completeness.
```
Check for:
- Missing docs for existing services (docker-compose.*.yaml)
- Outdated information
- Missing sections (installation, configuration, usage, uninstall)
```

### document <topic>
Manually trigger documentation for a topic.
```
Creates or updates docs/services/<topic>.md
```

### status
Show documentation coverage summary.
```
Lists:
- Services with documentation
- Services missing documentation
- Last updated timestamps
```

## Implementation Checklist

When implementing, always:
1. Check if service already has docs in `docs/services/`
2. If new service: create `docs/services/<name>.md`
3. If modifying existing: update relevant doc file
4. Include docker-compose file reference
5. Add port numbers, environment variables, volumes
6. Document any manual setup steps

## Examples

After creating `docker-compose.myservice.yaml`:
- Auto-create `docs/services/myservice.md`

After running `docker compose up`:
- Update service docs with any config changes

After creating `scripts/myscript.sh`:
- Document in relevant infrastructure doc or create new one
