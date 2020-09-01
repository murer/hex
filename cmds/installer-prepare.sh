#!/bin/bash -xe

[[ "x$UID" == "x0" ]]

apt -y update
apt -y install \
  software-properties-common

apt-add-repository universe

apt install -y \
  gdisk fdisk gpart \
  cryptsetup \
  debootstrap debconf-utils \
  arch-install-scripts \
  vim curl wget
