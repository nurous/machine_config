if [ !  `which gcc` ]; then
  sudo xcode-select --install
fi

# Ensure homebrew is not using full XCode (ideally it shouldn't be needed)
sudo xcode-select -switch /Library/Developer/CommandLineTools

if [ ! `which brew` ]; then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi

echo "Updating Homebrew"
brew update

if [ ! -f '/usr/local/Library/Taps/caskroom/homebrew-cask' ]; then
  echo "Installing Homebrew Cask"
  brew tap caskroom/cask
fi

if [ ! `which git` ]; then
  echo "Installing Git"
  brew install git
fi

mkdir -p ~/work/projects/own
mkdir -p ~/work/projects/client
mkdir -p ~/work/projects/contributing
mkdir -p ~/work/projects/learning
mkdir -p ~/work/projects/research
mkdir -p ~/work/projects/tw
