# File/Directory Management Skill

Manage files and directories in the homelab.

## Commands

### list <path>
List directory contents with details.
```
ls -la <path>
```
Shows: permissions, owner, size, modified date, filename.

### size <path>
Show disk usage for a path.
```
du -sh <path>
```
For directories, shows total size. For files, shows individual size.

### find <pattern>
Find files matching a glob pattern.
```
find /opt/docker -name "<pattern>"
```
Searches in /opt/docker by default. Use absolute paths for other locations.

### permissions <path>
Show detailed file/directory information.
```
stat <path>
```
Shows: permissions (octal + symbolic), owner, group, size, timestamps, inode.

### create-dir <path>
Create a directory with parent directories.
```
mkdir -p <path>
```
Creates all intermediate directories as needed. No error if directory exists.

### copy <src> <dst>
Copy file or directory recursively.
```
cp -r <src> <dst>
```
Preserves attributes with -p flag. Use -f to force overwrite.

### move <src> <dst>
Move or rename a file or directory.
```
mv <src> <dst>
```
Can besame directory used to rename () or move to different location.

## Common Paths

| Path | Description |
|------|-------------|
| /opt/docker | Main configuration directory |
| /mnt/sdcard/homelab-volumes | Docker volume data |
| /opt/docker/config | Service configurations |

## Examples

- List homelab config: `list /opt/docker/config`
- Check volume size: `size /mnt/sdcard/homelab-volumes`
- Find all YAML files: `find "*.yaml"`
- Create new directory: `create-dir /opt/docker/config/newdir`
- Copy file: `copy /path/to/file.txt /path/to/dest/`
- Move/rename: `move /old/name.txt /new/name.txt`
