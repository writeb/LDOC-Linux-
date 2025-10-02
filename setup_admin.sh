#!/usr/bin/env bash
set -euo pipefail

sudo groupadd -f admins
id admin1 >/dev/null 2>&1 || sudo useradd -m -s /bin/bash -g admins admin1

echo "%admins ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/admins > /dev/null
sudo chmod 0440 /etc/sudoers.d/admins

echo "Admin user admin1 created and added in sudo"