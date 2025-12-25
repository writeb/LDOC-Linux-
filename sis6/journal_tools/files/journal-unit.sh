#!/usr/bin/env bash
unit="$1"
if [[ -z "$unit" ]]; then
  echo "Usage: journal-unit.sh <unit>"
  exit 1
fi
journalctl -u "$unit" -n 200 -e
