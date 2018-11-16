#!/bin/bash

# Set bash_profile
ln -s ./bash/bash_profile ~/.bash_profile

# Install basics
sudo apt-get update
sudo apt-get install -y git vim

# Ruby/Rails Prereqs
sudo apt-get install -y curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev

# Install and Initiate VIM
sudo apt-get install -y vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ./vim/vimrc ~/.vimrc
vim +PlugInstall +qall

# Add Source Code Pro font
sudo mkdir /usr/share/fonts/truetype/sourcecodepro
sudo cp ./data/SourceCodeVariable* /usr/share/fonts/truetype/sourcecodepro/
sudo fc-cache -fv

# Add ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.1
asdf plugin-add ruby
asdf plugin-add nodejs

