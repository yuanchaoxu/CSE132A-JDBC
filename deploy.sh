#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./deploy.sh user@server-ip /var/www/ayotee
# Example:
#   ./deploy.sh ubuntu@1.2.3.4 /var/www/ayotee

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <user@server> <remote_path>"
  exit 1
fi

REMOTE_HOST="$1"
REMOTE_PATH="$2"

echo "[1/3] Create remote directory: ${REMOTE_PATH}"
ssh "${REMOTE_HOST}" "mkdir -p '${REMOTE_PATH}'"

echo "[2/3] Upload static files"
scp index.html styles.css script.js "${REMOTE_HOST}:${REMOTE_PATH}/"

echo "[3/3] Done"
echo "Files uploaded to ${REMOTE_HOST}:${REMOTE_PATH}"
echo "If using nginx, ensure root points to ${REMOTE_PATH} and reload nginx."
