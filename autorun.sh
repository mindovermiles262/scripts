#!/bin/bash

# Usage: ./autorun.sh [flags]
#
# Flags:
#   --cli => Only install vim, tmux, and bash_profile
for arg in "$@"; do
  if [ "$arg" == "--cli" ]; then
    CLI=true
  fi
done

# Install non-cli components, dev languages, etc
if [ ! "$CLI" ]; then
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

    # Ruby/Rails Prereqs
    sudo apt-get update
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

  fi
fi

# Installs on Linux (Includes --cli flag)
if [[ "$OSTYPE" == 'linux'* ]]; then
  # Install the basics
  sudo apt-get update
  sudo apt-get install -y git vim tmux
  
  # Set Git username/email
  git config --global user.name "Andy D"
  git config --global user.email "mindovermiles262@gmail.com"
fi


#==================
# GLOABL SETTINGS
#==================

# Link Bash Profile
if [[ -f "$HOME/.bash_profile"  || -L "$HOME/.bash_profile" ]]; then
  printf "Removing bash_profile ... "
  rm "$HOME/.bash_profile"
  printf "Done.\n" 
fi

ln -s $PWD/bash/bash_profile "$HOME/.bash_profile"

# Vim Settings
if [[ -f "$HOME/.vimrc" || -L "$HOME/.vimrc" ]]; then
  printf "Removing vimrc ... "
  rm "$HOME/.vimrc"
  printf "Done.\n" 
fi

if [ -d "$HOME/.vim" ]; then
  printf "Removing vim directory ... "
  rm -rf "$HOME/.vim"
  printf "Done.\n" 
fi

curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $PWD/vim/vimrc "$HOME/.vimrc"
ln -s $PWD/vim/ftplugin "$HOME/.vim/"
vim +PlugInstall +qall

# SymLink tmux.conf
if [[ -f "$HOME/.tmux.conf" || -L "$HOME/.tmux.conf" ]]; then
  printf "Removing .tmux.conf ... "
  rm "$HOME/.tmux.conf"
  printf "Done.\n"
fi
ln -s $PWD/tmux.conf "$HOME/.tmux.conf"

# Symlink tmux.macos
if [[ -f "$HOME/.tmux.macos" || -L "$HOME/.tmux.macos" ]]; then
  printf "Removing .tmux.macos ... "
  rm "$HOME/.tmux.macos"
  printf "Done.\n"
fi
ln -s $PWD/tmux.macos "$HOME/.tmux.macos"

# Symlink tmux.linux
if [[ -f "$HOME/.tmux.linux" || -L "$HOME/.tmux.linux" ]]; then
  printf "Removing .tmux.linux ... "
  rm "$HOME/.tmux.linux"
  printf "Done.\n"
fi
ln -s $PWD/tmux.linux "$HOME/.tmux.linux"

