#!/bin/bash
set -e
echo "=== [1/10] Cleaning Disk and Installing Master Tools ==="
sudo rm -rf /usr/share/dotnet /usr/local/lib/android /opt/ghc /usr/local/share/boost
sudo apt-get update
sudo apt-get install -y xorriso squashfs-tools wget curl rsync sed grep
mkdir -p workspace/source workspace/chroot workspace/output final_iso
