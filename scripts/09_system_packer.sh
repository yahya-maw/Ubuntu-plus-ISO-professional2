#!/bin/bash
set -e
echo "=== [9/10] Repacking SquashFS with Zstd (Max Power) ==="
OLD_SQUASH=$(find workspace/source -iname "filesystem.squashfs" | head -n 1)
sudo rm "$OLD_SQUASH"
sudo mksquashfs workspace/chroot "$OLD_SQUASH" -comp zstd -b 1M -noappend
