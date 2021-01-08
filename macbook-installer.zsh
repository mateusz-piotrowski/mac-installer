#!/bin/zsh

title () {
  echo ""
  echo "# = = = = = = = = = = = = "
  echo "# The Macbook Installer"
  echo "# = = = = = = = = = = = = "
  echo ""
}

heading () {
  printf "\n\n# $1\n\n"
}

# - - - - - - - - - - - - - - - - -

title

heading "Install Xcode Command Line Tools ..."
xcode-select --install
