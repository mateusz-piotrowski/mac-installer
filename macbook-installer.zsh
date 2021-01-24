#!/bin/zsh

title () {
  echo ""
  echo "# = = = = = = = = = = = = "
  echo "# The Macbook Installer"
  echo "# = = = = = = = = = = = = "
  echo ""
}

heading () {
  printf "\n\n$(tput setaf 2)# $1 $(tput sgr0) \n\n"
}

# - - - - - - - - - - - - - - - - -

title

heading "Installing Xcode Command Line Tools ..."
xcode-select --install

heading "Installing Homebrew package manager ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

heading "Installing Homebrew Cask ..."
brew cask

heading "Installing essential packages ..."
brew install zsh-autosuggestions wget mc

heading "Installing Neovim app ..."
brew install neovim

