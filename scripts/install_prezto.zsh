#!/bin/zsh

rm ~/.zshrc
rm ~/.zpreztorc

ln -s ~/Walker/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/Walker/dotfiles/zsh/zpreztorc ~/.zpreztorc

rm ~/.zprezto/modules/utility/init.zsh
rm ~/.zprezto/modules/prompt/functions/prompt_walker_setup
rm ~/.zprezto/modules/completion/init.zsh

ln -s ~/Walker/dotfiles/zsh/utility/init.zsh ~/.zprezto/modules/utility/init.zsh
ln -s ~/Walker/dotfiles/zsh/prompt/prompt_walker_setup ~/.zprezto/modules/prompt/functions/prompt_walker_setup
cp -f ~/Walker/dotfiles/zsh/completion/init.zsh ~/.zprezto/modules/completion/init.zsh

exit 0
