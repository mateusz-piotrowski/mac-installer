#!/bin/zsh

title () {
  echo ""
  echo "# = = = = = = = = = = = = "
  echo "# The Macbook Installer"
  echo "# = = = = = = = = = = = = "
  echo ""
}

heading () {
  printf "\n$(tput setaf 2)# $1 $(tput sgr0)\n\n"
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

heading "Installing Oh My Zsh ..."
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

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

heading "Installing Dash app ..."
brew install --cask dash

