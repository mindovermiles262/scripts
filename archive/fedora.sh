#!/bin/bash

# Install the basics, then Ruby prereqs
sudo yum update
sudo yum install -y \
  git vim tmux
  gcc-c++ patch readline readline-devel zlib zlib-devel \
  libyaml-devel libffi-devel openssl-devel make \
  bzip2 autoconf automake libtool bison sqlite-devel

# Add ASDF
if [ ! -d ~/.asdf ]; then
  echo "Installing ASDF ..."
  git clone --quiet https://github.com/asdf-vm/asdf.git ~/.asdf
  ~/.asdf/bin/asdf plugin-add ruby
  ~/.asdf/bin/asdf plugin-add nodejs
else
  echo "ASDF Directory already exists ..."
fi

# Set Git username/email
git config --global user.name "Andy D"
git config --global user.email "mindovermiles262@gmail.com"

#==================
# GLOABL SETTINGS
#==================

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

