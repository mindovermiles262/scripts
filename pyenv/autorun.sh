#!/bin/bash

#
# Installs Pyenv via Git Checkout.
#
# 2020-05-11
# @mindovermiles262
#

if [ "$TARGETENV" = "linux" ]; then
  sudo apt-get -qq install -y git
elif [ "$TARGETENV" = "fedora" ]; then
  sudo yum install -y git
fi

git clone \
  https://github.com/pyenv/pyenv.git \
  ~/.pyenv
