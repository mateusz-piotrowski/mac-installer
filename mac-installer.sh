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

if [ ! -d "/usr/local/Cellar/bash-completion" ]; then
  printf "\n$(tput setaf 2)# Bash-Completion package not found.$(tput sgr0)"
  is_bash_completion_exist=0
else
  is_bash_completion_exist=1
fi

if [ ! -d "/usr/local/Cellar/wget" ]; then
  printf "\n$(tput setaf 2)# Wget package not found.$(tput sgr0)"
  is_wget_exist=0
else
  is_wget_exist=1
fi

if [ ! -d "/usr/local/Cellar/curl" ]; then
  printf "\n$(tput setaf 2)# Curl package not found.$(tput sgr0)"
  is_curl_exist=0
else
  is_curl_exist=1
fi

if [[ $is_bash_completion_exist -eq "0" && is_wget_exist -eq "0" && is_curl_exist -eq "0" ]]; then
  heading "Installing essential packages ..."
  brew install bash-completion wget curl
  echo "[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"" >> ~/.bash_profile
else
  printf "$(tput setaf 2)# Bash-Completion already installed.$(tput sgr0)\n"
  printf "$(tput setaf 2)# Wget already installed.$(tput sgr0)\n"
  printf "$(tput setaf 2)# Curl already installed.$(tput sgr0)\n"
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/midnight-commander" ]; then
  printf "\n$(tput setaf 1)# Midnight Commander not found.$(tput sgr0)"
  is_mc_exist=0
else
  is_mc_exist=1
fi

if [[ ! $is_mc_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Midnight Commander already installed.$(tput sgr0)\n"
else
  heading "Installing Midnight Commander ..."
  brew install mc
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/htop" ]; then
  printf "\n$(tput setaf 1)# Htop not found.$(tput sgr0)"
  is_htop_exist=0
else
  is_htop_exist=1
fi

if [[ ! $is_htop_exist -eq "0" ]]; then
  printf "$(tput setaf 2)# Htop already installed.$(tput sgr0)\n"
else
  heading "Installing Htop ..."
  brew install htop
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Caskroom/Dash" ]; then
  printf "\n$(tput setaf 1)# Dash not found.$(tput sgr0)"
  is_dash_exist=0
else
  is_dash_exist=1
fi

if [[ ! $is_dash_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Dash already installed.$(tput sgr0)\n\n"
else
  heading "Installing Dash ..."
  brew install --cask dash
fi

# - - - - - - - - - - - - - - - - -
