#!/bin/bash
set -e
echo "=== [8/10] Cleaning Up Chroot Points ==="
sudo umount -l workspace/chroot/dev || true
sudo umount -l workspace/chroot/run || true
sudo umount -l workspace/chroot/proc || true
sudo umount -l workspace/chroot/sys || true
