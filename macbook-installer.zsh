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

