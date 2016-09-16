#!/bin/bash

set -e

fetch(){
 echo "Fetching $1"  
 curl -O $2
}

# TODO: Move to a '.bash_functions' file that can be sourced in '.bash_profile'
append-to-file() {
  LINE=$1
  FILE=$2
  echo "Appending '$LINE' to '$FILE'"
  grep -q "$LINE" "$FILE" || echo "$LINE" | sudo tee -a "$FILE"
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
	homebrew/fuse/encfs \
	keka \
	kindle \
	intellij-idea \
	iterm2 \
	java \
	jdownloader \
        lastpass \
	libreoffice \
	macfusion \
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
	telegram \
        thunderbird \
        vagrant \
        virtualbox \
;

# Homebrew extensions
brew tap rafaelgarrido/homebrew-caveats && brew install brew-caveats


mkdir -p  ~/Downloads/Installers
cp ManualDownloads.html ~/Downloads/Installers
open ~/Downloads/Installers/ManualDownloads.html

cd ~/Downloads/Installers

fetch 'EncFS for MacFusion 2' http://t-haeberle.com/encfs/EncFS%20for%20Macfusion2.dmg


TEXT_NORMAL=$(tput setaf 0)
TEXT_HEADER=$(tput setaf 4)
TEXT_ITEMS=$(tput setaf 5)
CAT <<EOF
${TEXT_HEADER}
----------
Next Steps
----------
${TEXT_ITEMS}
1. Review homebrew caveats to find extra instructions you might want to complete
	${TEXT_NORMAL}- 'brew list -1 | xargs brew caveats'${TEXT_ITEMS}
2. Execute '/usr/local/Homebrew/Caskroom/lastpass/latest/LastPass Installer.app' to finish lastpass installation

3. Additional programs to download the latest version of are listed at ~/Downloads/Installers/ManualDownloads.html

EOF
echo -e "\033[32mDone\033[0m"
