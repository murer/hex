#!/bin/bash -xe

cmd_install() {
	apt -y install openbox tint2 gmrun arandr xinit
	apt -y install --no-install-recommends libnotify-bin xfce4-notifyd
	apt -y install --no-install-suggests xscreensaver 
	#apt -y install nitrogen

	if [ ! -f /etc/xdg/tint2.original.tar.gz ]; then
		cd /etc/xdg
		tar czf tint2.original.tar.gz tint2/*
		rm -rfv tint2/*
		cd -
	fi

	cp -Rv etc/xdg/tint2/* /etc/xdg/tint2

	if [ ! -f /etc/xdg/openbox.original.tar.gz ]; then
		cd /etc/xdg
		tar czf openbox.original.tar.gz openbox/*
		rm -rfv openbox/*
		cd -
	fi

	cp -Rv etc/xdg/openbox/* /etc/xdg/openbox
}

cmd_lockscreen() {
	hexblade_lockscreen="${1?'enable or disable'}"
	if [[ "x$hexblade_lockscreen" == "xenable" ]]; then
		cp -v etc/xdg/openbox/autostart.d/30-screensaver.sh /etc/xdg/openbox/autostart.d
	elif [[ "x$hexblade_lockscreen" == "xdisable" ]]; then
		rm -v /etc/xdg/openbox/autostart.d/30-screensaver.sh || true
		[[ ! -f /etc/xdg/openbox/autostart.d/30-screensaver.sh ]]
	else
		false
	fi
}


cmd_xinit() {
	cp -v home/xinitrc ~/.xinitrc
}

cd "$(dirname "$0")"; _cmd="${1?"cmd is required"}"; shift; "cmd_${_cmd}" "$@"
