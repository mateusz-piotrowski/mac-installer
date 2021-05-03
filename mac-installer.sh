#!/bin/bash

# - - - - - - - - - - - - - - - - -

title () {
  echo ""
  echo "# = = = = = = = = = = = = "
  printf "#$(tput setaf 4) The Mac Installer$(tput sgr0)\n"
  echo "# = = = = = = = = = = = = "
}

# - - - - - - - - - - - - - - - - -

heading () {
  printf "\n$(tput setaf 6)# $1 $(tput sgr0)\n\n"
}

# - - - - - - - - - - - - - - - - -

title

# - - - - - - - - - - - - - - - - -

if [ -d "/Library/Developer" ]; then
  printf "\n$(tput setaf 2)# Xcode Command Line Tools already installed.$(tput sgr0)\n"
else
  heading "Installing Xcode Command Line Tools ..."
  xcode-select --install
fi

# - - - - - - - - - - - - - - - - -

if [ -d "/usr/local/Homebrew" ]; then
  printf "$(tput setaf 2)# Homebrew Package Manager already installed.$(tput sgr0)\n"
  printf "$(tput setaf 2)# Homebrew Cask already installed.$(tput sgr0)\n\n"
else
  heading "Installing Homebrew package manager ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# - - - - - - - - - - - - - - - - -
