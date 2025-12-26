#!/bin/bash
PATH_DIR="$1"
USER_NAME="redisadmin"

if [-z "$PATH_DIR"]; then
    echo "Give path"
    exit 1
fi 

sudo mkdir -p "$PATH_DIR"
sudo mkdir -p "$PATH_DIR/data"

if ! id "$USER_NAME" >/dev/null 2>&1; then 
    sudo useradd "$USER_NAME"
fi

sudo chown -R "$USER_NAME:$USER_NAME" "$PATH_DIR/data"
sudo chmod 770 "$PATH_DIR/data"

echo "users prepared"