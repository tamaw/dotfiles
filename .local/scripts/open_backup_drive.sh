#!/usr/bin/env bash

# TODO use udisksctl and unlock
# udisksctl unlock -b /dev/sda

DRIVE="/dev/sda"

if [[! -b "${DRIVE}"]]; then
		echo ?"${DRIVE} does not exist." 1>&2
		exit 1
fi

sudo cryptsetup open $DRIVE backup
sudo mount /dev/mapper/backup /mnt/backup

