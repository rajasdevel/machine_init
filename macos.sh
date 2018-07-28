echo "Author: Rajas Abhyankar <rajas.devel@gmail.com>"
echo "Setup fresh OSX(10.10+) machine, please read and modify the script to your liking before executing"
echo "To make this file executable: chmod +x osx.sh"
echo "You will be asked to enter admin password several times"

cd ~
# Enable FileVault
echo "FileVault is full disk encryption for OSX, If you need to backup your key to iCloud, please do this from System Preferences, otherwise answer 'y'"
echo "Enable FileVault? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;then
    sudo fdesetup enable
else
    echo "Not enabling FileVault"
fi
# Check privacy settings
# Enable trackpad gestures
 defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1
# Set keyboard and mosue sensitivity
# Change appearance, switch to dark theme
echo "Switch to Dark Theme? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;then
    sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark
else
    echo "Keeping current theme ..."
fi
# Show hidden files in finder
echo "Show hidden files in finder? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;then
    defaults write com.apple.finder AppleShowAllFiles YES
fi

defaults write -g PMPrintingExpandedStateForPrint -bool TRUE


# Install OhMyZSH
curl -L http://install.ohmyz.sh | sh

#Install RVM:
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Setup environment for brew
"export HOMEBREW_CASK_OPTS=\"--appdir=/Applications\"" >> ~/.bash_profile
"export HOMEBREW_CASK_OPTS=\"--appdir=/Applications\"" >> ~/.zshrc

# Install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Tap
brew tap homebrew/dupes
brew tap homebrew/science
brew tap josegonzalez/php

# Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Brew packages
brew install ack
brew install Caskroom/cask/xquartz
brew install ffmpeg
brew install gcc
brew install gfortran
brew install htop
brew install imagemagick
brew install iotop
brew install mongodb
brew install mtr --no-gtk
brew install mysql
brew install nginx
brew install nmap
brew install node
brew install openssl
brew install php70 --with-pear --with-imap
brew install php70-xdebug
brew install postgresql
brew install pyqt
brew install python
brew install python3
brew install r
brew install redis
brew install wget
brew install wireshark --with-qt
brew install zmq

# Cask packages
brew cask install anaconda
brew cask install android-studio
brew cask install atom
brew cask install calibre
brew cask install dropbox
brew cask install firefoxdeveloperedition
brew cask install gimp
brew cask install google-chrome
brew cask install inkscape
brew cask install intellij-idea
brew cask install iterm2
brew cask install java
brew cask install libreoffice
brew cask install macvim
brew cask install mounty
brew cask install mysql-workbench
brew cask install netspot
brew cask install opera
brew cask install pgadmin3
brew cask install qbittorrent
brew cask install rstudio
brew cask install skype
brew cask install sublime-text3
brew cask install teamviewer
brew cask install textexpander
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

# Python
pip install virtualenv virtualenvwrapper simplejson six Django Flask numpy scipy matplotlib ipython pyzmq pygments

# NPM packages
npm install -g yo grunt-cli protractor karma-cli jshint jscs

# PHP
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
echo 'export PATH="$PATH:~/.composer/vendor/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:~/.composer/vendor/bin"' >> ~/.zshrc
# Add composer path to profile

# Ruby
gem install rails
gem install bropages


# From the App Store, install:
# xcode, evernote, dash3, skitch, pocket, mediashare, imovie, microsoft remote desktop, kindle
# monthlycal

# Browser plug-ins:
# ublock, disconnect, pocket, evernote web clipper, awesome screenshots, builtwith, wappalyzer, color picker, postman, zenmate

# ST3 Plugins
# Package contorl, sftp, sidebarenhancements, emmet, bracket highlighter, sublimecodeintel, colorpicker, html5, html-css-js-prettify, prettyjson, angularjs, git, gitgutter, allautocomplete, sublimerepl, filediffs, phpcs
# ST3 Config
# "font_size": 14,
# "open_files_in_new_window": false,
# "word_wrap": true,
# "spell_check": true,

# IntelliJ Additional Plug-ins
# Python, Ruby, PHP, NodeJS, Scala, PHP Frameowrks, Laravel, LiveReload, FileWatchers, Angular, EJS, 