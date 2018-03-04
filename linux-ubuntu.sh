#!/bin/bash
# CAUTION: Untested
# Please run as root

echo "Adding repositories...\n";

pushd .
mkdir /staging
cd /staging


# Java
add-apt-repository -y ppa:webupd8team/java;

# Go
add-apt-repository -y ppa:gophers/archive;

# Sublime Text 3
add-apt-repository -y ppa:webupd8team/sublime-text-3;

# Code Blocks
add-apt-repository ppa:damien-moore/codeblocks-stable;

# Nginx
add-apt-repository -y ppa:nginx/stable;

# Tor Browser
add-apt-repository -y ppa:webupd8team/tor-browser;

#Grub customizer
add-apt-repository -y ppa:danielrichter2007/grub-customizer;

#Flatpak
add-apt-repository -y ppa:alexlarsson/flatpak;

# SDR
add-apt-repository -y ppa:bladerf/bladerf;
add-apt-repository -y ppa:ettusresearch/uhd;
add-apt-repository -y ppa:myriadrf/drivers;
add-apt-repository -y ppa:myriadrf/gnuradio;
add-apt-repository -y ppa:gqrx/gqrx-sdr;

# uGet
add-apt-repository -y ppa:plushuang-tw/uget-stable;

# Chrome 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -;
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list';

# Vivaldi
wget -O - http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -;
echo "deb http://repo.vivaldi.com/stable/deb/ stable main" | tee /etc/apt/sources.list.d/vivaldi.list;


# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";

# Skype
curl -fsSL  https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -;
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skypeforlinux.list;

# Wire
wget -q https://wire-app.wire.com/linux/releases.key -O- | sudo apt-key add -;
echo "deb https://wire-app.wire.com/linux/debian stable main" | tee /etc/apt/sources.list.d/wire-desktop.list;

# Insync
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C;
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C;
echo "deb http://apt.insynchq.com/ubuntu $(lsb_release -cs) non-free contrib" | tee /etc/apt/sources.list.d/insync.list;

echo "Updating repositories and upgrading...\n";

# Node (this scripts runs update automatically)
curl -sL https://deb.nodesource.com/setup_9.x | bash -
apt upgrade -y;

echo "Installing base packages";
# Docker
apt install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual;

apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    build-essential \
    zsh;

echo "Installing oh-my-zsh";
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";



echo "Installing packages included in Ubuntu Multiverse";
sudo apt install anki \
	ardour \
	bleachbit \
	blender \
	breeze-icon-theme \
	browser-plugin-vlc \
	chrome-gnome-shell \
	chromium-browser \
	clamav \
	clamtk \
	dconf-editor \
	filezilla \
	fonts-powerline \
	fonts-roboto \
	gimp \
	git \
	gnome-shell-pomodoro \
	gnome-tweak-tool \
	gparted \
	gqrx-sdr \
	gstreamer1.0-libav \
	gufw \
	handbrake \
	inotify-tools \
	kdenlive \
	libaio-dev \
	libasound2-dev \
	libavcodec-extra \
	libfftw3-dev \
	libgtk-3-dev \
	libhamlib-dev \
	libjpeg62 \
	libopenjp2-7 \
	libopenjp2-7-dev \
	libpulse-dev \
	libusb-1.0-0-dev \
	libv4l-dev \
	libvolk1-bin \
	mono-devel \
	obs-studio \
	phoronix-test-suite \
	playonlinux \
	ppa-purge \
	qbittorrent \
	qt5-default \
	r-base \
	skypeforlinux \
	sni-qt \
	stellarium \
	sublime-text-installer \
	tmux \
	uget \
	veracrypt \
	vim \
	virtualbox \
	vlc \
	wine-stable \
	winetricks \
	xbacklight \
	xbindkeys \
	xbindkeys-config \
	xclip \
	xvkbd \
	zenmap;

echo "Install Software from added repos";
sudo apt install -y docker-ce \
	oracle-java9-installer \
	nodejs \
	flatpak \
	codeblocks \
	codeblocks-contrib \
	cubicsdr \
	grub-customizer \
	golang-1.9-go \
	google-chrome-stable \
	rstudio \
	teamviewer \
	vivaldi-stable \
	wire-desktop \
	insync;

# Todo
# 
# tor \
# torbrowser-launcher 
# Anaconda

# Teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb;
dpkg -i teamviewer_amd64.deb;

snap install intellij-idea-ultimate brave;

pip install powerline-status;

# For GQRX
volk_profile

rm -rf /staging
popd

