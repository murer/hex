#!/bin/bash -xe

cd "$(dirname "$0")"
pwd

mkdir -p target

wget --progress=dot -e dotbytes=1M -c \
  'https://github.com/atom/atom/releases/latest/download/atom-amd64.deb' \
  -O target/atom-amd64.deb

if ! atom -v; then
  dpkg -i target/atom-amd64.deb || true
  apt $HEXBLADE_APT_ARGS install -yf
  dpkg -i target/atom-amd64.deb
fi