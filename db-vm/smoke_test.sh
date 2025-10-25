#!/bin/bash
echo "Running DB VM smoke test"
sudo systemctl status postgresql | grep Acitve
sudo -u postgres psql -c "\l"
echo "DB VM smoke test finished"
