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

if [ ! -x "$(command xcode-select --install)" ]; then
  printf "\n$(tput setaf 2)# Xcode Command Line Tools already installed.$(tput sgr0)\n"
else
  heading "Installing Xcode Command Line Tools ..."
  xcode-select --install
fi

if [ -d "/usr/local/Homebrew" ]; then
  printf "\n$(tput setaf 2)# Homebrew Package Manager already installed.$(tput sgr0)\n"
else
  heading "Installing Homebrew package manager ..."
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

heading "Installing iTerm2 app ..."
brew install --cask iterm2

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

heading "Installing Basecamp app ..."
brew install --cask basecamp

heading "Installing Teams app ..."
brew install --cask microsoft-teams

heading "Installing Slack app ..."
brew install --cask slack

heading "Installing Signal app ..."
brew install --cask signal

heading "Installing Discord app ..."
brew install --cask discord

heading "Installing TeX [Basic] suite ..."
brew install basictex

heading "Installing AnyDesk app ..."
brew install --cask anydesk

heading "Installing Remote Desktop Manager [Free] app ..."
brew install --cask remote-desktop-manager-free
