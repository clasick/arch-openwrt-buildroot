# Basic Arch Linux based OpenWrt buildroot image
FROM base/archlinux

MAINTAINER Jannis Pinter <jannis@pinterjann.is>

RUN pacman -Sy --noconfirm --needed subversion asciidoc bash bc binutils fastjar \
	flex git gcc util-linux gawk intltool make cdrkit openssl \
	patch perl-extutils-makemaker rsync sdcc unzip wget gettext libxslt \
	boost libusb bin86 sharutils b43-fwcutter findutils sudo &&\
useradd -m openwrt &&\
echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
sudo -iu openwrt git clone git://git.openwrt.org/openwrt.git &&\
sudo -iu openwrt openwrt/scripts/feeds update

USER openwrt
WORKDIR /home/openwrt/openwrt/
CMD ["/bin/bash"] 