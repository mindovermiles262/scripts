#!/bin/bash

#
# To be run on a tempary server. Installs Bash Profile, Vim, and Tmux Configs
#

sudo apt-get update -y
sudo apt-get install vim git tmux

# Link Bash Profile
if [ -f ~/.bash_profile ]; then
  printf "Removing bash_profile ... "
  rm ~/.bash_profile
  printf "Done.\n" 
fi

ln -s $PWD/bash/bash_profile ~/.bash_profile

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
ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim/ftplugin ~/.vim/
vim +PlugInstall +qall

# SymLink tmux.conf
if [ -f ~/.tmux.conf ]; then
  printf "Removing .tmux.conf ... "
  rm ~/.tmux.conf
  printf "Done.\n"
fi
ln -s $PWD/tmux.conf ~/.tmux.conf
