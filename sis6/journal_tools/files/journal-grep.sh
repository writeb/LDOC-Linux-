#!/usr/bin/env bash
pattern="$1"
if [[ -z "$pattern" ]]; then
  echo "Usage: journal-grep.sh <pattern>"
  exit 1
fi
journalctl -o short-iso | grep -i --color "$pattern"
