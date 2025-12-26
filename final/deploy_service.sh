#!/bin/bash

IMAGE="$1"
PATH_DIR="$2"

if [ -z "$IMAGE" ] || [ -z "$PATH_DIR" ]; then
    echo "Usage: deploy_service <image> <path>"
    exit 1
fi

sudo tee /etc/systemd/system/redis.service >/dev/null <<EOF
[Unit]
Description=Redis container
After=network.target

[Service]
Restart=always
ExecStartPre=/usr/bin/podman rm -f redis
ExecStart=/usr/bin/podman run --name redis --network host \
  -e REDIS_PASSWORD=redis \
  -v $PATH_DIR/data:/data \
  $IMAGE
ExecStop=/usr/bin/podman stop redis

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now redis

echo "Redis service deployed"
