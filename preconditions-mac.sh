if [ !  -d '/Library/Developer/CommandLineTools' ]; then
  sudo xcode-select --install
  echo "XCode Command Line Tools are not installed! Download and install before continuing"
  exit 1
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

