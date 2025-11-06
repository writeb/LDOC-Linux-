#!/usr/bin/env bash
CONTAINER="custom-nginx"
if ! /usr/bin/docker ps | grep -q "$CONTAINER"; then
  echo "$(date): Container $CONTAINER not running, restarting service..." >> /var/log/container_check.log
  /bin/systemctl restart custom-nginx.service
else
  echo "$(date): $CONTAINER is running fine." >> /var/log/container_check.log
fi
