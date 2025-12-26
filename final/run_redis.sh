#!/bin/bash
IMAGE="$1"
PATH_DIR="$2"

if [-z "$IMAGE"] || [-z "$PATH_DIR"]; then
    echo "Write image and path"
    exit 1
fi

sudo podman rm -f redis >/dev/null 2>&1

sudo podman run -d \
    --name redis \
    --network host \
    -e REDIS_PASSWORD=redis \ 
    -v "$PATH_DIR/data:/data" \
    "$IMAGE"

echo "Container started"