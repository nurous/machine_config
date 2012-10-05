fetch(){
 echo "Fetching $1"  
 curl -O $2
}

mkdir ~/Downloads/Installers
cp ManualDownloads.html ~/Downloads/Installers
open ~/Downloads/Installers/ManualDownloads.html

cd ~/Downloads/Installers

fetch "Chrome" https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"

echo "Additional programs to download the latest version of are listed at ~/Downloads/Installers/ManualDownloads.html"
