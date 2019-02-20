#!/bin/bash

# Set bash_profile
if [ -f ~/.bash_profile ]; then
	printf "Deleting bash_profile ... "
	rm ~/.bash_profile
	printf "Done.\n"
fi
ln -s ~/Documents/scripts/bash/bash_profile ~/.bash_profile

# Install basics
sudo apt-get update
sudo apt-get install -y git vim

# Ruby/Rails Prereqs
sudo apt-get install -y curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev

# Install and Initiate VIM
sudo apt-get install -y vim
if [ -f ~/.vimrc ]; then
	printf "Deleting vimrc ... "
	rm ~/.vimrc
	printf "Done.\n"
fi
if [ -d ~/.vim ]; then
	printf "Deleting vim directory ... "
	rm -rf ~/.vim
	printf "Done.\n"
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/Documents/scripts/vim/vimrc ~/.vimrc
vim +PlugInstall +qall

# Add ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.1
source ~/.bash_profile
asdf plugin-add ruby
asdf plugin-add nodejs

