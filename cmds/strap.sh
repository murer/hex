#!/bin/bash -xe

[[ "x$UID" == "x0" ]]

cd "$(dirname "$0")/.."
pwd

set +x
source target/config/params.txt || true
set -x

debootstrap kali-rolling /mnt/hexblade/installer

