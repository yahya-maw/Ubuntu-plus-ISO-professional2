#!/bin/bash
set -e
echo "=== [7/10] Configuring Persistence and Handlers ==="
# ضمان بقاء Downloads
mkdir -p workspace/chroot/etc/skel/Downloads
touch workspace/chroot/etc/skel/Downloads/.permanent

# مشغل APK/EXE
cat << 'EOF' | sudo tee workspace/chroot/usr/share/applications/handler.desktop
[Desktop Entry]
Type=Application
Name=Ultimate Installer
Exec=bash -c "if [[ %f == *.apk ]]; then waydroid app install %f; else wine %f; fi"
MimeType=application/vnd.android.package-archive;application/x-ms-dos-executable;
EOF
