#!/usr/bin/env bash

DRIVE="/dev/sda"

if [[! -b "${DRIVE}"]]; then
		echo ?"${DRIVE} does not exist." 1>&2
		exit 1
fi

sudo umount /mnt/backup
sudo cryptsetup close backup
sudo udisksctl power-off -b /dev/sda

