#!/bin/bash
IMAGE="$1"

if [-z "$IMAGE"]; then
    echo "Write image name"
    exit 1
fi

if ! sudo podman info >/dev/null 2>&1; then
    echo "Podman is not working"
    exit 1
fi

echo "Podman version: "
sudo podman --version

if ! sudo podman image exists "$IMAGE"; then
    echo "Image not found, pulling"
    sudo podman pull "$IMAGE"
else 
    echo "Image exists"
fi

echo "Environment is ready"