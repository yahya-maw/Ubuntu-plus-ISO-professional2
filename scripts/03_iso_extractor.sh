#!/bin/bash
set -e
echo "=== [3/10] Extracting ISO Structure ==="
sudo xorriso -osirrox on -indev workspace/base.iso -extract / workspace/source/
sudo chmod -R 777 workspace/source/
