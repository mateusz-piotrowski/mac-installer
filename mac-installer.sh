#!/bin/bash

# - - - - - - - - - - - - - - - - -

title () {
  echo ""
  echo "# = = = = = = = = = = = = "
  printf "#$(tput setaf 4) The Mac Installer$(tput sgr0)\n"
  echo "# = = = = = = = = = = = = "
}

# - - - - - - - - - - - - - - - - -

installing () {
  printf "\n$(tput setaf 6)# $1 $(tput sgr0)\n\n"
}

not_found () {
  printf "\n$(tput setaf 1)# Not found:$(tput setaf 3) $1 $(tput sgr0)\n"
}

# - - - - - - - - - - - - - - - - -

title

# - - - - - - - - - - - - - - - - -

if [ -d "/Library/Developer" ]; then
  printf "\n$(tput setaf 2)# Xcode Command Line Tools already installed.$(tput sgr0)\n"
else
  installing "Installing Xcode Command Line Tools ..."
  xcode-select --install
fi

# - - - - - - - - - - - - - - - - -

if [ -d "/usr/local/Homebrew" ]; then
  printf "$(tput setaf 2)# Homebrew Package Manager already installed.$(tput sgr0)\n"
  printf "$(tput setaf 2)# Homebrew Cask already installed.$(tput sgr0)\n"
else
  installing "Installing Homebrew package manager ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/heroku" ]; then
  printf "\n$(tput setaf 1)# Heroku package not found.$(tput sgr0)"
  is_heroku_exist=0
else
  is_heroku_exist=1
fi

if [[ ! $is_heroku_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Heroku already installed.$(tput sgr0)"
else
  installing "Installing Heroku ..."
  brew tap heroku/brew
  brew install heroku
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/git" ]; then
  printf "\n$(tput setaf 1)# Git package not found.$(tput sgr0)"
  is_git_exist=0
else
  is_git_exist=1
fi

if [[ ! $is_git_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Git already installed.$(tput sgr0)"
else
  installing "Installing Git ..."
  brew install git
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/bash-completion" ]; then
  printf "\n$(tput setaf 2)# Bash-Completion package not found.$(tput sgr0)"
  is_bash_completion_exist=0
else
  is_bash_completion_exist=1
fi

if [[ ! $is_bash_completion_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Bash Completion already installed.$(tput sgr0)"
else
  installing "Installing Bash Completion ..."
  brew install bash-completion
  echo "[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"" >> ~/.bash_profile
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/wget" ]; then
  printf "\n$(tput setaf 2)# Wget package not found.$(tput sgr0)"
  is_wget_exist=0
else
  is_wget_exist=1
fi

if [[ ! $is_wget_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Wget already installed.$(tput sgr0)"
else
  installing "Installing Wget ..."
  brew install wget
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/curl" ]; then
  printf "\n$(tput setaf 2)# Curl package not found.$(tput sgr0)"
  is_curl_exist=0
else
  is_curl_exist=1
fi

if [[ ! $is_curl_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Curl already installed.$(tput sgr0)\n"
else
  installing "Installing Curl ..."
  brew install curl
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/ripgrep" ]; then
  printf "\n$(tput setaf 1)# Ripgrep not found.$(tput sgr0)"
  is_ripgrep_exist=0
else
  is_ripgrep_exist=1
fi

if [[ ! $is_ripgrep_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Ripgrep already installed.$(tput sgr0)"
else
  installing "Installing Ripgrep ..."
  brew install ripgrep
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/coreutils" ]; then
  printf "\n$(tput setaf 1)# Coreutils not found.$(tput sgr0)"
  is_coreutils_exist=0
else
  is_coreutils_exist=1
fi

if [[ ! $is_coreutils_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Coreutils already installed.$(tput sgr0)"
else
  installing "Installing Coreutils ..."
  brew install coreutils
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/fd" ]; then
  printf "\n$(tput setaf 1)# Fd not found.$(tput sgr0)"
  is_fd_exist=0
else
  is_fd_exist=1
fi

if [[ ! $is_fd_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Fd already installed.$(tput sgr0)\n"
else
  installing "Installing Fd ..."
  brew install fd
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
  installing "Installing Midnight Commander ..."
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
  installing "Installing Htop ..."
  brew install htop
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/gh" ]; then
  not_found "gh"
  is_gh_exist=0
else
  is_gh_exist=1
fi

if [[ ! $is_gh_exist -eq "0" ]]; then
  printf "$(tput setaf 2)# gh already installed.$(tput sgr0)\n\n"
else
  installing "Installing gh ..."
  brew install gh
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/zsh" ]; then
  printf "\n$(tput setaf 1)# Zsh not found.$(tput sgr0)"
  is_zsh_exist=0
else
  is_zsh_exist=1
fi

if [[ ! $is_zsh_exist -eq "0" ]]; then
  printf "$(tput setaf 2)# Zsh already installed.$(tput sgr0)\n"
else
  installing "Installing Zsh ..."
  brew install zsh
fi

if [ ! -d "/usr/local/Cellar/zsh-completions" ]; then
  printf "\n$(tput setaf 1)# Zsh-Completion not found.$(tput sgr0)"
  is_zsh_completion_exist=0
else
  is_zsh_completion_exist=1
fi

if [[ ! $is_zsh_completion_exist -eq "0" ]]; then
  printf "$(tput setaf 2)# Zsh-Completion already installed.$(tput sgr0)\n"
else
  installing "Installing Zsh-Completion ..."
  brew install zsh-completion
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/fish" ]; then
  not_found "Fish"
  is_fish_exist=0
else
  is_fish_exist=1
fi

if [[ ! $is_fish_exist -eq "0" ]]; then
  printf "$(tput setaf 2)# Fish already installed.$(tput sgr0)\n"
else
  installing "Installing Fish ..."
  brew install fish
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Cellar/gnupg" ]; then
  printf "\n$(tput setaf 1)# GnuPG not found.$(tput sgr0)"
  is_gnupg_exist=0
else
  is_gnupg_exist=1
fi

if [[ ! $is_gnupg_exist -eq "0" ]]; then
  printf "$(tput setaf 2)\n# GnuPG already installed.$(tput sgr0)\n"
else
  installing "Installing GnuPG ..."
  brew install gnupg
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Caskroom/Dash" ]; then
  printf "\n$(tput setaf 1)# Dash not found.$(tput sgr0)"
  is_dash_exist=0
else
  is_dash_exist=1
fi

if [[ ! $is_dash_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Dash already installed.$(tput sgr0)\n"
else
  installing "Installing Dash ..."
  brew install --cask dash
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Caskroom/TextMate" ]; then
  printf "\n$(tput setaf 1)# TextMate not found.$(tput sgr0)"
  is_textmate_exist=0
else
  is_textmate_exist=1
fi

if [[ ! $is_textmate_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# TextMate already installed.$(tput sgr0)"
else
  installing "Installing TextMate ..."
  brew install --cask textmate
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Caskroom/Visual-Studio-Code" ]; then
  printf "\n$(tput setaf 1)# Visual Studio Code not found.$(tput sgr0)"
  is_visual_studio_code_exist=0
else
  is_visual_studio_code_exist=1
fi

if [[ ! $is_visual_studio_code_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Visual Studio Code already installed.$(tput sgr0)\n"
else
  installing "Installing Visual Studio Code ..."
  brew install --cask visual-studio-code
fi

# - - - - - - - - - - - - - - - - -

if [ ! -d "/usr/local/Caskroom/Transmission" ]; then
  printf "\n$(tput setaf 1)# Transmission not found.$(tput sgr0)"
  is_transmission_exist=0
else
  is_transmission_exist=1
fi

if [[ ! $is_transmission_exist -eq "0" ]]; then
  printf "\n$(tput setaf 2)# Transmission already installed.$(tput sgr0)\n\n"
else
  installing "Installing Transmission ..."
  brew install --cask transmission
fi

# - - - - - - - - - - - - - - - - -
