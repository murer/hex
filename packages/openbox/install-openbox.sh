#!/bin/bash -xe

cd "$(dirname "$0")"
pwd

sudo apt $HEXBLADE_APT_ARGS -y install openbox tint2 xscreensaver gmrun arandr caja-seahorse libnotify-bin xinit
#sudo apt $HEXBLADE_APT_ARGS -y install nitrogen

if [ ! -f /etc/xdg/tint2.original.tar.gz ]; then
	cd /etc/xdg
	sudo tar czf tint2.original.tar.gz tint2/*
	sudo rm -rfv tint2/*
	cd -
fi

sudo cp -Rv tint2/* /etc/xdg/tint2

if [ ! -f /etc/xdg/openbox.original.tar.gz ]; then
	cd /etc/xdg
	sudo tar czf openbox.original.tar.gz openbox/*
	sudo rm -rfv openbox/*
	cd -
fi

sudo cp -Rv etc/xdg/openbox/* /etc/xdg/openbox

#cp -v home/xinitrc ~/.xinitrc
