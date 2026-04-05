#!/bin/bash
set -e
echo "=== [10/10] Generating Final Bootable ISO ==="
sudo xorriso -as mkisofs -r -V "UBUNTU_G62_ULTIMATE" -o final_iso/HP-G62-System.iso workspace/source/
echo "✅ MISSION ACCOMPLISHED"
