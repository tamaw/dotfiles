#!/usr/bin/env bash

set -e
set -o nounset
set -o pipefail

SOURCE_DIR="${HOME}"
DEST_DIR="/mnt/backup/home"
DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
BACKUP_PATH="${DEST_DIR}/${DATETIME}"
LATEST_LINK="${DEST_DIR}/latest"

mkdir -p "${DEST_DIR}"

rsync -a --delete "${SOURCE_DIR}/" --link-dest "${LATEST_LINK}" --exclude ".cache" --exclude ".local/share/Trash" "${BACKUP_PATH}"

sync

rm -rf "${LATEST_LINK}"
ln -s "${BACKUP_PATH}" "${LATEST_LINK}"

