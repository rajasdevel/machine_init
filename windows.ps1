
Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# chocolatey settings
choco feature enable -n allowGlobalConfirmation

# Install packages

# cinst -y lastpass
cinst -y 7zip.install
cinst -y anaconda3
cinst -y androidstudio
cinst -y anti-beacon
cinst -y bleachbit
cinst -y calibre
cinst -y ccleaner
cinst -y chromium
cinst -y codeblocks
cinst -y cpu-z
cinst -y crystaldiskinfo
cinst -y crystaldiskinfo.portable
cinst -y crystaldiskmark
cinst -y curl
cinst -y dbeaver
cinst -y docker
cinst -y docker-compose
cinst -y ffmpeg
cinst -y filezilla
cinst -y firefox
cinst -y freefilesync
cinst -y gimp
cinst -y git.install
cinst -y gitkraken
cinst -y golang
cinst -y googlechrome
cinst -y googleearth
cinst -y gpu-z
cinst -y inkscape
cinst -y intellijidea-ultimate
cinst -y jdk10
cinst -y jdownloader
cinst -y libreoffice-fresh
# cinst -y malwarebytes
cinst -y meld
cinst -y microsoft-r-open
cinst -y minikube
cinst -y nirlauncher
cinst -y nmap
cinst -y nodejs
cinst -y notepadplusplus.install
cinst -y pdfcreator
cinst -y postman
cinst -y procexp
cinst -y procmon
cinst -y putty.install
cinst -y qbittorrent
cinst -y r.studio
cinst -y ruby
cinst -y sandboxie.install
# cinst -y spybot
cinst -y sqlite
cinst -y stellarium
cinst -y sublimetext3
cinst -y sysinternals
cinst -y teamviewer
cinst -y teracopy
cinst -y tor-browser
cinst -y unetbootin
cinst -y veracrypt
cinst -y vim
cinst -y virtualbox
cinst -y visualstudiocode
cinst -y vivaldi
cinst -y vlc
cinst -y wget
cinst -y whatsapp
cinst -y windirstat
cinst -y windowsrepair
cinst -y wireshark
cinst -y zulu


