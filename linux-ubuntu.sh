#!/bin/bash
# CAUTION: Untested
# NOTE: Please run as root, this is not unattended install, you will be prompted by some packages for configuration
# NOTE: Targets Ubuntu 18.10

echo "Adding repositories...\n";

#Grub customizer
add-apt-repository -y ppa:danielrichter2007/grub-customizer

# GNS3
add-apt-repository -y ppa:gns3/ppa

# Docker
apt install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    zsh;

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";

# Insync
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C;
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C;
echo "deb http://apt.insynchq.com/ubuntu $(lsb_release -cs) non-free contrib" | tee /etc/apt/sources.list.d/insync.list;

echo "Updating repositories and upgrading...\n"

# Node (this scripts runs update automatically)
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -

# Upgrade existing
apt upgrade -y

echo "Installing base packages"

# For sublime text
apt install -y libgtk2.0-0


echo "Installing packages included in Ubuntu Multiverse"
sudo apt install anki \
	bleachbit \
	blender \
	breeze-icon-theme \
	chkrootkit \
	chrome-gnome-shell \
	chromium-browser \
	cifs-utils \
	cockpit \
	cockpit-docker \
	cockpit-pcp \
	dconf-editor \
	filezilla \
	flatpak \
	fonts-oxygen \
	fonts-powerline \
	fonts-roboto \
	gimp \
	git \
	gnome-boxes \
	gnome-shell-pomodoro \
	gnome-software-plugin-flatpak \
	gnome-tweak-tool \
	golang \
	gparted \
	gufw \
	handbrake \
	htop \
	httpie \
	inotify-tools \
	kdenlive \
	libavcodec-extra \
	mariadb-server \
	meld \
	nginx \
	obs-studio \
	phoronix-test-suite \
	php-fpm \
	php-mysql \
	php-pear \
	php-xdebug \
	php-xml \
	playonlinux \
	ppa-purge \
	python-pip \
	python3-pip \
	qbittorrent \
	qt5-default \
	r-base \
	redis-server \
	ruby \
	ruby-dev \
	sysdig \
	tmux \
	tree \
	ufw \
	uget \
	valgrind \
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
	youtube-dl \
	zeal \
	zenmap;

echo "Install Software from added repos"
sudo apt install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	gns3-gui \
	grub-customizer \
	insync \
	insync-nautilus \
	nodejs;


# Install snap packages
snap install sublime-text --classic
snap install skype --classic
snap install vscode --classic
snap install powershell --classic
snap install kubectl --classic
snap install intellij-idea-community --classic
snap install tor-browser --classic

snap install postman telegram-desktop signal-desktop wire brave okular tusk bitwarden redis-desktop-manager doctl


# Add flathub remote
flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
#Install flatpack packages
flatpak install -y flathub org.freefilesync.FreeFileSync
flatpak install -y flathub us.zoom.Zoom
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub io.dbeaver.DBeaverCommunity

# Python
pip install powerline-status

# Ruby
gem install bropages


# SDR
# ech "Installing SDR"
# add-apt-repository -y ppa:bladerf/bladerf;
# add-apt-repository -y ppa:ettusresearch/uhd;
# add-apt-repository -y ppa:myriadrf/drivers;
# add-apt-repository -y ppa:myriadrf/gnuradio;
# add-apt-repository -y ppa:gqrx/gqrx-sdr;

# apt install -y \
# 	libaio-dev \
# 	libasound2-dev \
# 	libfftw3-dev \
# 	libgtk-3-dev \
# 	libhamlib-dev \
# 	libjpeg62 \
# 	libopenjp2-7 \
# 	libopenjp2-7-dev \
# 	libpulse-dev \
# 	libusb-1.0-0-dev \
# 	libv4l-dev \
# 	libvolk1-bin \
#	gqrx-sdr \
#	cubicsdr;

# For GQRX
#volk_profile

# Setup firewall
ufw default deny incoming
ufw default allow outgoing
# ufw allow 'Nginx Full'
ufw enable

# Set up gnome
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true

# Disable development service
systemctl systemctl disable nginx mysql redis php7.2-fpm.service

# Configure MariaDB
mysql_secure_installation

# Binary and Script Installations
curl https://sh.rustup.rs -sSf | sh

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# Make common folders
mkdir ~/Documents/Docs
mkdir ~/Documents/Project-Code
mkdir ~/Documents/Programming

# Todo
# 
# Anaconda
# VMWare Workstation Pro
# Vivaldi
# Chrome
# Zoom
# TeamViewer
# MySQL Workbench
# Minikube?
# PHP: cgi.fix_pathinfo=0


# If dual booting with windows
# timedatectl set-local-rtc 1


# Update ~/.zshrc

echo '' >> ~/.zshrc >> ~/.profile
echo '' >> ~/.zshrc >> ~/.profile
echo '#Modifications:' >> ~/.zshrc >> ~/.profile
echo 'export PATH="/home/r/anaconda3/bin:$PATH"' >> ~/.zshrc >> ~/.profile
echo 'export PATH="$PATH:/usr/lib/go-1.10/bin"' >> ~/.zshrc >> ~/.profile
echo 'export GOROOT=/usr/lib/go-1.10'  >> ~/.zshrc >> ~/.profile
echo 'export PATH="$PATH:$GOROOT/bin"'  >> ~/.zshrc >> ~/.profile
echo 'export PATH="$PATH:$HOME/.cargo/env"' >> ~/.zshrc >> ~/.profile
echo '' >> ~/.zshrc >> ~/.profile
echo 'alias tbase="tmux attach -t base || tmux new -s base"' >> ~/.zshrc >> ~/.profile
echo 'alias up="sudo apt update; sudo apt upgrade -y; sudo apt autoremove; sudo flatpak update; sudo snap refresh"' >> ~/.zshrc >> ~/.profile
echo 'alias startdev="sudo systemctl start nginx mysql redis php7.2-fpm.service; sudo systemctl status nginx mysql redis php7.2-fpm.service"' >> ~/.zshrc >> ~/.profile
echo 'alias stopdev="sudo systemctl stop nginx mysql redis php7.2-fpm.service"' >> ~/.zshrc >> ~/.profile
echo '' >> ~/.zshrc >> ~/.profile
echo 'alias cddocs="cd ~/Documents/Docs"' >> ~/.zshrc >> ~/.profile
echo 'alias cdprjc="cd ~/Documents/Project-Code"' >> ~/.zshrc >> ~/.profile
echo 'alias cdprjd="cd ~/Documents/Docs/Project-Docs"' >> ~/.zshrc >> ~/.profile
echo 'alias cdpro="cd ~/Documents/Programming"' >> ~/.zshrc >> ~/.profile
echo 'alias cddl="cd ~/Downloads"' >> ~/.zshrc >> ~/.profile
echo 'alias cddls="cd ~/Documents/Docs/Downloads-Shared"' >> ~/.zshrc >> ~/.profile
echo 'alias cddld="cd ~/mnt/D/Downloads"' >> ~/.zshrc >> ~/.profile