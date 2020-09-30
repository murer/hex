#!/bin/bash -xe

cd "$(dirname "$0")"
pwd

rm -rf target/virtualbox || true
mkdir -p target/virtualbox

apt $HEXBLADE_APT_ARGS install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc | apt-key add -
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -

echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | tee /etc/apt/sources.list.d/virtualbox.list
echo "# deb-src http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | tee -a /etc/apt/sources.list.d/virtualbox.list

apt $HEXBLADE_APT_ARGS -y update
apt-cache search virtualbox | grep ^virtualbox
apt $HEXBLADE_APT_ARGS install -y virtualbox-6.1 dkms

usermod -aG vboxusers "$USER"

# Install usb 30 support extention: https://www.virtualbox.org/wiki/Downloads
wget --progress=dot -e dotbytes=64K -c \
  -O target/virtualbox/Oracle_VM_VirtualBox_Extension_Pack.vbox-extpack \
  'https://download.virtualbox.org/virtualbox/6.1.14/Oracle_VM_VirtualBox_Extension_Pack-6.1.14.vbox-extpack'
vboxmanage extpack install ~/Downloads/Oracle_VM_VirtualBox_Extension_Pack.vbox-extpack