# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm -f ~/.vimrc
ln -s ~/Walker/dotfiles/vim/vimrc ~/.vimrc

# install vim plugins
vim +PlugInstall +qall
