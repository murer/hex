FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install sudo

RUN groupadd -r supersudo && \
  echo "%supersudo ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/supersudo && \
  useradd -u 1000 -m -G adm,cdrom,sudo,supersudo,dip,plugdev -s /bin/bash hexblade

RUN mkdir -p /opt/hexblade/packages

COPY packages/graphics /opt/hexblade/packages/graphics
RUN sudo -u hexblade /opt/hexblade/packages/graphics/install-graphics.sh

COPY packages/openbox /opt/hexblade/packages/openbox
RUN sudo -u hexblade /opt/hexblade/packages/openbox/install-openbox.sh
