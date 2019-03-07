#!/bin/bash


if [[ "$OSTYPE" =~ "darwin" ]]; then
  printf "MacOS Detected... Running script for Mac...\n"
  #==================
  # MAC SETTINGS
  #==================

  # Install Homebrew

  if [[ $(which brew) ]]; then
    printf "Homebrew is already installed... continuing...\n"
  else
    printf "Cannot find homebrew in PATH, Installing now... "
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    printf "done...\n"
  fi


elif [[ "$OSTYPE" == 'linux'* ]]; then
  printf "Linux Detected... Running script for Linux...\n"

  #==================
  # LINUX SETTINGS
  #==================

  # Install the basics
  sudo apt-get update
  sudo apt-get install -y git vim tmux

  # Ruby/Rails Prereqs
  sudo apt-get install -y curl git gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev

  # Add ASDF
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.1
  source ~/.bash_profile
  asdf plugin-add ruby
  asdf plugin-add nodejs


  # Use libinput touchpad settings
  sudo cp ~/Documents/scripts/40-libinput.conf /usr/share/X11/xorg.conf.d/
  if [ -f /usr/share/X11/xorg.conf.d/70-synaptics.conf ]; then
    sudo mv /usr/share/X11/xorg.conf.d/70-synaptics.conf /usr/share/X11/xorg.conf.d/70-synaptics.conf.bak
  fi

  # Set Git username/email
  git config --global user.name "Andy D"
  git config --global user.email "mindovermiles262@gmail.com"
fi


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

