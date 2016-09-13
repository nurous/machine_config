#!/bin/bash

set -e

# Enable Tab/Cancel in Mac dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Require password immediately after screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
