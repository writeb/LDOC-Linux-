#!/usr/bin/env bash
LOG_DIR="/var/log"
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -print -delete
echo "$(date): Old logs cleaned up." >> /var/log/log_cleanup.log
