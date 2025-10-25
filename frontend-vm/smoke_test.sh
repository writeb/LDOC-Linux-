#!/bin/bash
echo "Running Frontend VM smoke test"
nginx -t
sudo systemctl status nginx | grep Active
curl -I http://localhost
echo "Frontend VM smoke test finished"
