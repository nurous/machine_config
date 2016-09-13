# TODO: Abort if XCode command line tools not installed
if [ !  `which gcc` ]; then echo "XCode Command Line Tools are not installed! Download and install before continuing" ;exit 1; fi;

# TODO : Check if RVM present
if [ ! `which rvm` ]; then
  echo "Installing RVM"
  curl -L https://get.rvm.io | bash -s stable 
  source ~/.rvm/scripts/rvm
  rvm install ruby-head
fi

# TODO : check if homebrew installed
if [ ! `which rvm` ]; then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi

echo "Updating Homebrew"
brew update

# Ensure homebrew is not using full XCode (ideally it shouldn't be needed)
sudo xcode-select -switch /usr/bin

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
