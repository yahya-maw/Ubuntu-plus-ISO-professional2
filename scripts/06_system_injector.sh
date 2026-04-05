#!/bin/bash
set -e
echo "=== [6/10] Injecting Drivers and Software (No Shortcuts) ==="
sudo chroot workspace/chroot /bin/bash << 'EOF'
set -e
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y software-properties-common curl wget gnupg

# إضافة كل المستودعات
curl -s https://repo.waydro.id | bash
add-apt-repository ppa:mx-linux/mx-tools -y
dpkg --add-architecture i386
mkdir -pm755 /etc/apt/keyrings
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor | tee /etc/apt/keyrings/winehq-archive.key > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/winehq-archive.key] https://dl.winehq.org/wine-builds/ubuntu/ noble main" | tee /etc/apt/sources.list.d/winehq.list

apt-get update
# تثبيت XFCE وتعريفات Intel والبرامج
apt-get install -y xubuntu-desktop waydroid winehq-staging mx-apps mx-tools \
                   synaptic zram-config xserver-xorg-video-intel mesa-utils
# ضبط الـ ZRAM
echo "ALGO=lz4" >> /etc/default/zramswap
echo "vm.swappiness=150" >> /etc/sysctl.conf
apt-get clean
exit
EOF
