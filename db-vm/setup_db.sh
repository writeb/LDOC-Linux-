#!/usr/bin/env bash
set -euo pipefail

sudo groupadd -f postgres
id postgres >/dev/null 2>&1 || sudo useradd -r -s /usr/sbin/nologin -g postgres postgres

sudo mkdir -p /var/lib/postgresql /etc/postgresql
sudo chown -R postgres:postgres /var/lib/postgresql /etc/postgresql
sudo chmod -R 700 /var/lib/postgresql /etc/postgresql

sudo groupadd -f teachers
sudo groupadd -f students
id teacher1 >/dev/null 2>&1 || sudo useradd -m -s /bin/bash -g teachers teacher1
id student1 >/dev/null 2>&1 || sudo useradd -m -s /bin/bash -g students student1

echo "DB VM: postgres, teacher1, student1 created"
