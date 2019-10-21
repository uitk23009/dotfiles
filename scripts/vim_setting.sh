# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/Documents/Website/dotfiles/vim/vimrc ~/.vimrc

# install vim plugins
vim +PlugInstall +qall
