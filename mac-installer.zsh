#!/bin/zsh

# - - - - - - - - - - - - - - - - -

title () {
  echo ""
  echo "# = = = = = = = = = = = = "
  printf "#$(tput setaf 4) The Mac Installer$(tput sgr0)\n"
  echo "# = = = = = = = = = = = = "
}

heading () {
  printf "\n$(tput setaf 6)# $1 $(tput sgr0)\n\n"
}

# - - - - - - - - - - - - - - - - -

title

if [ ! -d "xcode-select --install" ]; then
  printf "\n$(tput setaf 2)# Xcode Command Line Tools already installed.$(tput sgr0)\n"
else
  heading "Installing Xcode Command Line Tools ..."
  xcode-select --install
fi

heading "Installing Homebrew package manager ..."
if [ ! -d "/usr/local/Homebrew" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

heading "Installing Homebrew Cask ..."
if [ ! -d "/usr/local/Homebrew/Library/Homebrew/cask" ]; then
  brew cask
fi

heading "Installing essential packages ..."
brew install zsh-autosuggestions wget curl

heading "Installing tools ..."
brew install htop mc

heading "Installing Oh My Zsh ..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

heading "Installing Neovim app ..."
brew install neovim

heading "Installing Emacs app ..."
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
cp -r /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app

heading "Installing Doom Emacs ..."
brew install ripgrep coreutils fd

if [ ! -d "$HOME/.emacs.d" ]; then
  git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
fi
if [ ! -d "$HOME/.doom.d" ]; then
  ~/.emacs.d/bin/doom install
fi

heading "Installing Visual Studio Code ..."
brew install --cask visual-studio-code

heading "Installing Dash app ..."
brew install --cask dash

heading "Installing Docker platform ..."
brew install --cask docker

heading "Installing Signal app ..."
brew install --cask signal
