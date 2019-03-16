echo "Author: Rajas Abhyankar <rajas.devel@gmail.com>"
echo "Setup fresh OSX(10.10+) machine, please read and modify the script to your liking before executing"
echo "To make this file executable: chmod +x osx.sh"
echo "You will be asked to enter admin password several times"

# Enable trackpad gestures
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1
defaults write com.apple.finder AppleShowAllFiles YES
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Tap
brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/science
brew tap homebrew/php
brew tap caskroom/versions
brew tap homebrew/services

# dev & utils
brew install ack
brew install apache-spark
brew install bash-completion
brew install Caskroom/cask/xquartz
brew install cocoapods
brew install dnsmasq
brew install ffmpeg
brew install gcc
brew install gfortran
brew install git
brew install go
brew install htop
brew install imagemagick
brew install iotop
brew install macvim --override-system-vim --custom-system-icons
brew install mongodb
brew install mtr --no-gtk
brew install mysql
brew install nano
brew install nginx
brew install nmap
brew install node
brew install openssl
brew install parallel
brew install php --without-apache --with-fpm --with-mysql --with-pear --with-imap
brew install php-xdebug
brew install postgresql
brew install protobuf
brew install pyqt
brew install python
brew install python3
brew install r
brew install rdesktop
brew install redis
brew install sqlcipher
brew install sqlite
brew install svn
brew install terraform
brew install tree
brew install unrar
brew install vault
brew install vim
brew install wine
brew install winetricks
brew install wireshark --with-qt
brew install zmq

# GNU 
brew install bash
brew install binutils
brew install coreutils
brew install curl
brew install diffutils
brew install ed
brew install emacs
brew install file-formula
brew install findutils
brew install gawk
brew install gdb  # gdb requires further actions to make it work. See `brew info gdb`.
brew install gnu-indent
brew install gnu-sed
brew install gnu-tar
brew install gnu-which
brew install gnutls
brew install gpatch
brew install grep
brew install gzip
brew install less
brew install m4
brew install make
brew install rsync
brew install screen
brew install unzip
brew install watch
brew install wdiff --with-gettext
brew install wget
brew install zsh

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

# Cleanup
brew cleanup

# PHP
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer


# Install OhMyZSH
curl -L http://install.ohmyz.sh | shsh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)


echo '' >> ~/.zshrc >> ~/.bash_profile
echo '' >> ~/.zshrc >> ~/.bash_profile
echo '# Modifications:' >> ~/.zshrc >> ~/.bash_profile

echo 'PATH="/usr/local/anaconda3/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/curl/bin:/usr/local/opt/file-formula/bin:/usr/local/opt/m4/bin:/usr/local/opt/make/libexec/gnubin:/usr/local/opt/unzip/bin:/usr/local/opt/sqlite/bin:/usr/local/opt/openssl/bin:/usr/local/opt/gettext/bin:/usr/local/opt/ruby/bin:$PATH:/usr/local/opt/go/libexec/bin:~/.composer/vendor/bin"' >> ~/.zshrc >> ~/.bash_profile
echo '' >> ~/.zshrc >> ~/.bash_profile

echo 'export MANPATH="/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/make/libexec/gnuman:/usr/local/opt/grep/libexec/gnuman:/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"' >> ~/.zshrc
echo '' >> ~/.zshrc >> ~/.bash_profile
echo '' >> ~/.zshrc >> ~/.bash_profile

echo 'alias tbase="tmux attach -t base || tmux new -s base"' >> ~/.zshrc >> ~/.bash_profile
echo 'alias up="brew tap; brew update; brew upgrade; brew cu; brew cleanup;"' >> ~/.zshrc >> ~/.bash_profile
echo 'alias startdev="brew services start nginx; brew services start mariadb; brew services start php; brew services list;"' >> ~/.zshrc >> ~/.bash_profile
echo 'alias stopdev="brew services start nginx; brew services start mariadb; brew services start php; brew services list;"' >> ~/.zshrc >> ~/.bash_profile
echo 'alias cddl="cd ~/Downloads"' >> ~/.zshrc >> ~/.bash_profile
echo 'alias cddocs="cd ~/Documents/Docs"' >> ~/.zshrc >> ~/.bash_profile
echo 'alias cdprojd="cd ~/Documents/Docs/Projects-Docs"' >> ~/.zshrc >> ~/.bash_profile
echo 'alias cdprojc="cd ~/Documents/Projects-Code"' >> ~/.zshrc >> ~/.bash_profile
echo 'alias cdprog="cd ~/Documents/Programming"' >> ~/.zshrc >> ~/.bash_profile

# Ruby
gem install bropages

# Python
pip install power

echo "set startup-with-shell off" >> ~/.gdbinit

# From the App Store, install:
# xcode, evernote, pocket, mediashare, imovie, microsoft remote desktop, kindle, monthlycal

# ST3 Config
# {
# 	"font_size": 19,
# 	"ignored_packages":
# 	[
# 		"Vintage"
# 	],
# 	"open_files_in_new_window": false,
# 	"word_wrap": true,
# 	"spell_check": true,
# }
