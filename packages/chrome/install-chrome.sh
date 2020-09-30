#!/bin/bash -xe

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list
apt $HEXBLADE_APT_ARGS update
apt $HEXBLADE_APT_ARGS -y install google-chrome-stable