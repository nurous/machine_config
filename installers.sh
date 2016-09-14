#!/bin/bash

set -e

fetch(){
 echo "Fetching $1"  
 curl -O $2
}


echo "Homebrew installs"

# Optional Dependencies
brew install \
        gettext \
        readline \
        pcre \
;

# Normal Homebrew
brew install \
	httpie \
	rbenv \
	nvm \
	postgresql \
	postgis \
	pyenv \
	zsh \
;

# Homebrew casks
brew cask install \
        alfred \
	appcleaner \
	atom \
	caffeine \
	clipmenu \
	disk-inventory-x \
	docker \
        evernote \
        firefox \
        google-chrome \
        gpgtools \
	keka \
	kindle \
	intellij-idea \
	iterm2 \
	java \
	jdownloader \
        lastpass \
	libreoffice \
	name-mangler \
	odrive \
	pgadmin3 \
        picasa \
	progressive-downloader \
	screenhero \
        skype \
        slack \
        spectacle \
	steam \
        thunderbird \
        vagrant \
        virtualbox \
;

mkdir -p  ~/Downloads/Installers
cp ManualDownloads.html ~/Downloads/Installers
open ~/Downloads/Installers/ManualDownloads.html

cd ~/Downloads/Installers
echo "Additional programs to download the latest version of are listed at ~/Downloads/Installers/ManualDownloads.html"
