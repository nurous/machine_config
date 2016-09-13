fetch(){
 echo "Fetching $1"  
 curl -O $2
}

mkdir ~/Downloads/Installers
cp ManualDownloads.html ~/Downloads/Installers
open ~/Downloads/Installers/ManualDownloads.html

cd ~/Downloads/Installers

fetch "Chrome" https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
fetch "Google Drive" https://dl-ssl.google.com/drive/installgoogledrive.dmg

if [ ! `which gettext` ]; then
  echo "Installing gettext"
  brew install gettext
  brew link gettext
fi

if [ ! `which zsh` ]; then
  echo "Installing zsh"
  brew install zsh
fi

if [ ! `which ntfs-3g` ]; then
  echo "Installing NTFS-3G"
  brew install ntfs-3g

  # brew info fuse4x-kext
  sudo cp -rfX /usr/local/Cellar/fuse4x-kext/0.9.1/Library/Extensions/fuse4x.kext /Library/Extensions
  sudo chmod +s /Library/Extensions/fuse4x.kext/Support/load_fuse4x

  # brew info ntfs-3g
  sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.orig
  sudo ln -s /usr/local/Cellar/ntfs-3g/2012.1.15/sbin/mount_ntfs /sbin/mount_ntfs
fi


echo "Additional programs to download the latest version of are listed at ~/Downloads/Installers/ManualDownloads.html"
