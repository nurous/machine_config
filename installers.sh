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
        jenv \
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
	android-file-transfer \
	appcleaner \
	atom \
	caffeine \
	clipmenu \
        dash \
	disk-inventory-x \
	docker \
        evernote \
        firefox \
        google-chrome \
        gpgtools \
        java \
	keka \
	kindle \
	intellij-idea \
	iterm2 \
	jdownloader \
        lastpass \
	name-mangler \
	Caskroom/cask/pgadmin4 \
        picasa \
	progressive-downloader \
	screenhero \
        skype \
        slack \
        sourcetree \
        spectacle \
	steam \
	telegram \
        thunderbird \
        vagrant \
        virtualbox \
        vlc \
;

# git-redate https://github.com/PotatoLabs/git-redate
brew tap PotatoLabs/homebrew-git-redate
brew install git-redate

# Homebrew Casks Installs requiring password
brew cask install \
        libreoffice \
	odrive \
;

# Homebrew extensions
brew tap rafaelgarrido/homebrew-caveats && brew install brew-caveats


mkdir -p  ~/Downloads/Installers

# Create links for manual installs
ln -sf '/usr/local/Caskroom/lastpass/latest/LastPass Installer.app' ~/Downloads/Installers/
ln -sf `pwd`/ManualDownloads.html ~/Downloads/Installers/

cd ~/Downloads/Installers

# fetch 'EncFS for MacFusion 2' http://t-haeberle.com/encfs/EncFS%20for%20Macfusion2.dmg


TEXT_NORMAL=$(tput setaf 0)
TEXT_HEADER=$(tput setaf 4)
TEXT_ITEMS=$(tput setaf 5)
cat <<EOF
${TEXT_HEADER}
----------
Next Steps
----------
${TEXT_ITEMS}
1. Review homebrew caveats to find extra instructions you might want to complete
	${TEXT_NORMAL}- 'brew list -1 | xargs brew caveats'${TEXT_ITEMS}

2. Manually execute installers at 'open ~/Downloads/Installers/'

3. Manually download and execute installers at 'open ~/Downloads/Installers/ManualDownloads.html'

EOF
echo -e "\033[32mDone\033[0m"
