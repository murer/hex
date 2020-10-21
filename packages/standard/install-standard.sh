#!/bin/bash -xe

cd "$(dirname "$0")/.."
pwd

./tools/install-tools.sh
./graphics/install-graphics.sh
./firefox/install-firefox.sh
./sound/install-sound.sh
./openbox/install-openbox.sh
./lxdm/install-lxdm.sh
