#!/bin/bash
set -e
echo "=== [2/10] Fetching Dynamic ISO Link (Anti-404) ==="
BASE="https://releases.ubuntu.com/24.04/"
ISO_NAME=$(curl -sL $BASE | grep -Eo 'ubuntu-24\.04(\.[0-9]+)?-desktop-amd64\.iso' | head -n 1)
wget -q --show-progress -O workspace/base.iso "${BASE}${ISO_NAME}"

# فحص سلامة الملف (يجب أن يتجاوز 3 جيجا)
SIZE=$(stat -c%s workspace/base.iso)
if [ $SIZE -lt 3000000000 ]; then echo "❌ Fatal: ISO Download Corrupted!"; exit 1; fi
