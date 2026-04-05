#!/bin/bash
set -e
echo "=== [5/10] Preparing Chroot Environment ==="
sudo mount --bind /dev workspace/chroot/dev
sudo mount --bind /run workspace/chroot/run
sudo mount -t proc /proc workspace/chroot/proc
sudo mount -t sysfs /sys workspace/chroot/sys
sudo cp /etc/resolv.conf workspace/chroot/etc/
