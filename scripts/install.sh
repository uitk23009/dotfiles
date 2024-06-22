#!/bin/sh

set -xv
set -e

ssh-add ~/.ssh/id_ed25519

# install custom folder
mkdir -p ~/Walker

# check
# xcode-select -p

if ! command -v brew >/dev/null; then
    echo "Install Homebrew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Update Homebrew formulae..."
brew update --force
brew tap "homebrew/services"

# command line tools
brew install "git"
brew install "tig"
brew install "diff-so-fancy"
brew install "zsh"
brew install "nvim"
brew install "tmux"
brew install "htop"
brew install "reattach-to-user-namespace"
brew install "the_silver_searcher"
brew install "coreutils"
brew install "wget"
brew install "gcc"

# mac tools
brew install --cask google-chrome firefox brave-browser
brew install --cask iterm2
brew install --cask appcleaner
brew install --cask sizeup
brew install --cask karabiner-elements
brew install --cask raycast

brew cleanup

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# install dotfiles
rm -rf ~/Walker/dotfiles
git clone git@github.com:uitk23009/dotfiles.git ~/Walker/dotfiles

# install z.sh
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh

# install prezto
rm -rf "${ZDOTDIR:-$HOME}/.zprezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
zsh install_prezto.zsh
chsh -s /bin/zsh

# configure vim
source vim_setting.sh

# configure tmux
rm -rf ~/.tmux.conf
ln -s ~/Walker/dotfiles/tmux/tmux.conf ~/.tmux.conf

# tig configuration
rm -f ~/.tigrc
ln -s ~/Walker/dotfiles/tigrc ~/.tigrc

# editorconfig configuration
rm -f ~/.editorconfig
ln -s ~/Walker/dotfiles/editorconfig ~/.editorconfig

# gitconfig configuration
rm -f ~/.gitconfig
ln -s ~/Walker/dotfiles/gitconfig ~/.gitconfig

# neovim configuration
mkdir -p  ~/.config
rm -rf ~/.config/nvim
ln -s ~/Walker/dotfiles/nvim ~/.config/nvim