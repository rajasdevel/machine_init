#!/bin/bash
# CAUTION: Untested
# NOTE: Please run as root, this is not unattended install, you will be prompted by some packages for configuration
# NOTE: Targets Ubuntu 17.10 & 18.04

echo "Adding repositories...\n";

pushd $PWD
mkdir /staging
cd /staging

#WebUpd8
#add-apt-repository -y ppa:nilarimogard/webupd8;

# Java
add-apt-repository -y ppa:webupd8team/java;

# Go
add-apt-repository -y ppa:gophers/archive;

# Sublime Text 3
add-apt-repository -y ppa:webupd8team/sublime-text-3;

# Code Blocks
add-apt-repository -y ppa:damien-moore/codeblocks-stable;

# Nginx
add-apt-repository -y ppa:nginx/stable;

# Tor Browser
add-apt-repository -y ppa:webupd8team/tor-browser;

#Grub customizer
add-apt-repository -y ppa:danielrichter2007/grub-customizer;

#Flatpak
add-apt-repository -y ppa:alexlarsson/flatpak;

# GNS3
add-apt-repository -y ppa:gns3/ppa;

# SDR
add-apt-repository -y ppa:bladerf/bladerf;
add-apt-repository -y ppa:ettusresearch/uhd;
add-apt-repository -y ppa:myriadrf/drivers;
add-apt-repository -y ppa:myriadrf/gnuradio;
add-apt-repository -y ppa:gqrx/gqrx-sdr;

# uGet
add-apt-repository -y ppa:plushuang-tw/uget-stable;

# Elementary OS
# add-apt-repository -y ppa:elementary-os/stable;
# or daily
# add-apt-repository -y ppa:elementary-os/daily;

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
# Switching to snap package of skype instead
# curl -fsSL  https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -;
# echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skypeforlinux.list;

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
	chkrootkit \
	chrome-gnome-shell \
	chromium-browser \
	cifs-utils \
	clamav \
	clamtk \
	dconf-editor \
	filezilla \
	fonts-oxygen \
	fonts-powerline \
	fonts-roboto \
	gimp \
	git \
	gnome-shell-pomodoro \
	gnome-software-plugin-limba \
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
	limba \
	mariadb-server \
	meld \
	mono-devel \
	obs-studio \
	phoronix-test-suite \
	php-fpm \
	php-mysql \
	php-pear \
	playonlinux \
	ppa-purge \
	qbittorrent \
	qt5-default \
	r-base \
	redis-server \
	ruby \
	ruby-dev \
	sni-qt \
	stellarium \
	sublime-text-installer \
	tmux \
	uget \
	ufw \
	veracrypt \
	vim \
	virtualbox \
	vlc \
	wine-stable \
	winetricks \
	wireshark \
	xbacklight \
	xbindkeys \
	xbindkeys-config \
	xclip \
	xvkbd \
	zeal \
	zenmap;

echo "Install Software from added repos";
sudo apt install -y \
	codeblocks \
	codeblocks-contrib \
	cubicsdr \
	docker-ce \
	flatpak \
	gnome-software-plugin-flatpak \
	gns3-gui \
	golang-1.9-go \
	google-chrome-stable \
	grub-customizer \
	insync \
	insync-nautilus \
	insync-dolphin \
	nodejs \
	nginx \
	oracle-java9-installer \
	rstudio \
	teamviewer \
	vivaldi-stable \
	wire-desktop;


# Teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb;
apt-get install ./teamviewer_amd64.deb;

# Add flathub remote
flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo;
#Install flatpack packages
flatpak install -y flathub org.freefilesync.FreeFileSync;


# Install snap packages
snap install intellij-idea-ultimate skype brave tor-browser;

pip install powerline-status;

gem install bropages;

# For GQRX
volk_profile

# Configure MariaDB
mysql_secure_installation

# Setup firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow 'Nginx Full'
ufw enable

# Set up gnome
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true

popd
rm -rf /staging

# Todo
# 
# Anaconda
# VMWare Workstation Pro
# gns3-iou \
# PHP: cgi.fix_pathinfo=0
# Update ~/.zshrc
# export PATH="/home/r/anaconda3/bin:$PATH"
# export PATH="$PATH:/usr/lib/go-1.9/bin"
# export GOROOT=/usr/lib/go-1.9
# export PATH="$PATH:$GOROOT/bin"
# export PATH="$PATH:$HOME/.cargo/env"

# alias tbase="tmux attach -t base || tmux new -s base"
# alias up="sudo apt update; sudo apt upgrade -y; sudo apt autoremove; sudo snap refresh"