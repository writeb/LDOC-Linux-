#!/bin/bash

PATH_DIR="$1"
BACKUP_DIR="/var/data/backup"

if [ -z "$PATH_DIR" ]; then
    echo "Usage: redis_backup <path>"
    exit 1
fi

sudo mkdir -p "$BACKUP_DIR"

sudo tar -czf "$BACKUP_DIR/redis_backup_$(date +%F_%H-%M).tar.gz" \
    -C "$PATH_DIR/data" .

echo "Backup done"
