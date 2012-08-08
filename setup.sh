#!/usr/bin/env bash
set -e
set -u

OS="`uname`"
SCRIPT_LOCATION="`pwd`"

function link {
  move_original $2
  ln -sf $SCRIPT_LOCATION/$1 $2
  echo "Symlinked $2 to $1"
}

function move_original {
  if [ -f $1 ] || [ -d $1 ]; then
    mv $1 $1.local
  fi
}

if [[ `readlink ~/.bashrc` == $SCRIPT_LOCATION/bash/bashrc ]]; then
    echo "bash files already configured"
else
    link bash/bashrc ~/.bashrc
    link bash/bash_alias ~/.bash_alias
    link bash/bash_profile ~/.bash_profile
fi

if [[ `readlink ~/.gitconfig` == $SCRIPT_LOCATION/git/gitconfig ]]; then
    echo "Git already configured"
else
    link git/gitconfig ~/.gitconfig
    link git/gitignore ~/.gitignore
fi

if [[ `readlink ~/.vim` == $SCRIPT_LOCATION/vim ]]; then
    echo "Vim already configured"
else
    link vim ~/.vim
    link vim/vimrc ~/.vimrc
fi
