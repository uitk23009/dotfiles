#!/bin/zsh

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  rm -f "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm ~/.zshrc
rm ~/.zpreztorc

ln -s ~/Documents/Website/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/Documents/Website/dotfiles/zsh/zpreztorc ~/.zpreztorc

rm ~/.zprezto/modules/utility/init.zsh
rm ~/.zprezto/modules/prompt/functions/prompt_walker_setup
rm ~/.zprezto/modules/completion/init.zsh

ln -s ~/Documents/Website/dotfiles/zsh/utility/init.zsh ~/.zprezto/modules/utility/init.zsh
ln -s ~/Documents/Website/dotfiles/zsh/prompt/prompt_walker_setup ~/.zprezto/modules/prompt/functions/prompt_walker_setup
cp -f ~/Documents/Website/dotfiles/zsh/completion/init.zsh ~/.zprezto/modules/completion/init.zsh

exit 0
