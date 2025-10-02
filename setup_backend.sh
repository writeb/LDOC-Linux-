#!/usr/bin/env bash
set -euo pipefail

sudo groupadd -f backend
id backend_user >/dev/null 2>&1 || sudo useradd -m -s /usr/sbin/nologin -g backend backend_user

sudo mkdir -p /etc/student-monitoring /var/tmp/student-monitoring
sudo chown -R backend_user:backend /etc/student-monitoring /var/tmp/student-monitoring
sudo chmod -R 750 /etc/student-monitoring /var/tmp/student-monitoring

sudo groupadd -f teachers
sudo groupadd -f students
id teacher1 >/dev/null 2>&1 || sudo useradd -m -s /bin/bash -g teachers teacher1
id student1 >/dev/null 2>&1 || sudo useradd -m -s /bin/bash -g students student1

echo "Backend VM: backend_user, teacher1, student1 created"
