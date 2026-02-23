#!/bin/bash
# Toggle SD card mount at /mnt/sdcard

MOUNT_POINT="/mnt/sdcard"
DEVICE="/dev/mmcblk1"

if mountpoint -q "$MOUNT_POINT"; then
    echo "SD card is mounted. Unmounting..."
    sudo umount "$MOUNT_POINT"
    if [ $? -eq 0 ]; then
        echo "✓ SD card unmounted. Safe to remove!"
    else
        echo "✗ Failed to unmount. Checking what's using it..."
        lsof +D "$MOUNT_POINT" 2>/dev/null || echo "No processes found."
    fi
else
    echo "SD card is not mounted. Mounting..."
    sudo mount "$DEVICE" "$MOUNT_POINT"
    if [ $? -eq 0 ]; then
        echo "✓ SD card mounted at $MOUNT_POINT"
    else
        echo "✗ Failed to mount SD card"
    fi
fi
