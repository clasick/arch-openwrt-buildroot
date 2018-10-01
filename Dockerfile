# Basic Arch Linux based OpenWrt buildroot image
FROM base/archlinux

MAINTAINER Vignesh Kumar <xxvignesh@gmail.com>

RUN pacman -Sy --noconfirm archlinux-keyring &&\ 
pacman -S --needed --noconfirm subversion asciidoc bash bc binutils bzip2 fastjar \
	flex git gcc util-linux gawk intltool zlib mercurial make cdrkit ncurses \
	openssl patch perl-extutils-makemaker rsync sdcc unzip wget gettext libxslt \
	boost libusb bin86 sharutils b43-fwcutter findutils

RUN useradd -m openwrt &&\
echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt 

USER openwrt
WORKDIR /home/openwrt/openwrt/

RUN sudo -iu openwrt git clone git://git.openwrt.org/openwrt/openwrt.git &&\
	sudo -iu openwrt openwrt/scripts/feeds update -a