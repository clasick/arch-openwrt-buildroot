# Basic Arch Linux based OpenWrt buildroot image
FROM base/archlinux

RUN pacman -Sy --noconfirm archlinux-keyring &&\ 
pacman -S --needed --noconfirm subversion asciidoc bash bc binutils bzip2 fastjar \
	flex git gcc util-linux gawk intltool zlib mercurial make cdrkit ncurses \
	openssl patch perl-extutils-makemaker rsync sdcc unzip wget gettext libxslt \
	boost libusb bin86 sharutils b43-fwcutter sudo findutils

RUN useradd -m openwrt &&\
echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt 

USER openwrt
WORKDIR /home/openwrt/openwrt/

RUN sudo git clone git://git.openwrt.org/openwrt/openwrt.git
RUN sudo openwrt/scripts/feeds update -a