#!/bin/bash
set -e
echo "=== [4/10] Unpacking SquashFS (Smart Search) ==="
SQUASH_FILE=$(find workspace/source -iname "filesystem.squashfs" | head -n 1)
if [ -z "$SQUASH_FILE" ]; then echo "❌ SquashFS not found!"; exit 1; fi
sudo unsquashfs -d workspace/chroot "$SQUASH_FILE"
