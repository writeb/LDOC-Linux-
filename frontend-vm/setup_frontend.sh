#!/usr/bin/env bash
set -euo pipefail

sudo groupadd -f frontend
id frontend_user >/dev/null 2>&1 || sudo useradd -m -s /usr/sbin/nologin -g frontend frontend_user

sudo mkdir -p /var/www/student-monitor
sudo chown -R frontend_user:frontend /var/www/student-monitor
sudo chmod -R 750 /var/www/student-monitor

sudo groupadd -f teachers
sudo groupadd -f students
id teacher1 >/dev/null 2>&1 || sudo useradd -m -s /bin/bash -g teachers teacher1
id student1 >/dev/null 2>&1 || sudo useradd -m -s /bin/bash -g students student1

echo "Frontend VM: frontend_user, teacher1, student1 created"
