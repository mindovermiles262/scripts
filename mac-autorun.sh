#!/bin/bash

# Link Bash Profile
if [ -f ~/.bash_profile ]; then
  printf "Removing bash_profile ... "
	rm ~/.bash_profile
  printf "Done.\n" 
fi

ln -s ~/Documents/scripts/bash/bash_profile ~/.bash_profile

# Vim Settings
if [ -f ~/.vimrc ]; then
  printf "Removing vimrc ... "
  rm ~/.vimrc
  printf "Done.\n" 
fi

if [ -d ~/.vim ]; then
  printf "Removing vim directory ... "
  rm -rf ~/.vim
  printf "Done.\n" 
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/Documents/scripts/vim/vimrc ~/.vimrc
vim +PlugInstall +qall

