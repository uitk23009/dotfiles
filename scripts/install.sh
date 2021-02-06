#!/bin/sh

set -xv
set -e

# install custom folder
mkdir -p ~/Walker

# check
# xcode-select -p

if ! command -v brew >/dev/null; then
    echo "Install Homebrew"

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Update Homebrew formulae..."
brew update --force
brew tap "homebrew/services"
brew tap "caskroom/cask"

# command line tools
brew install "git"
brew install "tig"
brew install "diff-so-fancy"
brew install "zsh"
brew install "vim"
brew install "tmux"
brew install "openssl"
brew install "ctop"
brew install "htop"
brew install "reattach-to-user-namespace"
brew install "the_silver_searcher"
brew install "yarn"
brew install "coreutils"

# mac tools
brew cask install google-chrome firefox
brew cask install iterm2
brew cask install appcleaner
brew cask install sizeup
brew cask install karabiner-elements

brew cleanup

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# install dotfiles
git clone git@github.com:uitk23009/dotfiles.git ~/Walker/dotfiles

# install z.sh
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh

# install prezto
zsh install_prezto.zsh

# configure vim
source vim_setting.sh

# configure tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm ~/.tmux.conf
ln -s ~/Walker/dotfiles/tmux/tmux.conf ~/.tmux.conf
# install tmux plugins
tmux start-server
tmux new-session -d
source ~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server

# configure tig
rm ~/.tigrc
ln -s ~/Walker/dotfiles/tigrc ~/.tigrc

# configure editorconfig
rm ~/.editorconfig
ln -s ~/Walker/dotfiles/editorconfig ~/.editorconfig

# configure gitconfig
rm ~/.gitconfig
ln -s ~/Walker/dotfiles/itconfig ~/.gitconfig
