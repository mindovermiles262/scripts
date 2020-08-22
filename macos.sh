#!/bin/bash

PWD="$(pwd)"
DIR="$(dirname $0)"

#+++++++
# BREW
#+++++++

BREW_BIN="/usr/local/bin/brew"
BREW_INSTALL="tmux vim reattach-to-user-namespace"

if [ ! -f "$BREW_BIN" ]; then
  printf "[*] Brew not installed... Installing now... "
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "Done."
else
  echo "[*] Brew is already installed"
fi

if [ -f "$BREW_BIN" ]; then
  for program in $BREW_INSTALL
  do
    EXITCODE=$(brew list $program 2>/dev/null)
    if [ $? -eq 0 ]; then
      echo "[*] $program already installed. Skipping..."
    else
      printf "[!] Installing $program... "
      brew install "$program"
      echo "Done."
    fi
  done
fi

#+++++++++++++++++++
# ASDF Installation
#+++++++++++++++++++

PLUGINS="python ruby nodejs"

echo "[*] Installing ASDF..."
if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
fi

for plug in $PLUGINS
do
  if [ ! -d "$HOME/.asdf/plugins/$plug" ]; then
    printf "[*] Installing asdf plugin: $plug"
    asdf plugin add $plug
    echo "Done."
  else
    echo "[*] ASDF Plugin $plug already installed. Skipping..."
  fi
done



#+++++++++++++
# BASH CONFIG
#+++++++++++++

printf "[*] Installing bash_profile... "
ln -sf "$PWD/$DIR/bash/bash_profile" "$HOME/.bash_profile"
echo "Done."

#+++++++++++++
# TMUX CONFIG
#+++++++++++++

printf "[*] Installing tmux config... "
ln -sf "$PWD/$DIR/tmux/tmux.macos" "$HOME/.tmux.macos"
ln -sf "$PWD/$DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
echo "Done."

#++++++++++++
# VIM CONFIG
#++++++++++++

printf "[*] Installing vim configurations... "

if [[ ! -d "$HOME/.vim" ]]; then
    mkdir "$HOME/.vim"
fi

ln -sf "$PWD/$DIR/vim/vimrc" "$HOME/.vimrc"

# Install vim-plug
curl -sfLo "$HOME/.vim/autoload/plug.vim" \
    --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Silent PlugInstall: https://github.com/junegunn/vim-plug/issues/730
vim +'PlugInstall --sync' +qall

echo "Done."
