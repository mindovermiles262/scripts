#!/bin/bash

# Automated script to set up basic utils and programs of
# a new Distro installation.
#
# Usage:
# sudo ./install-script.sh
#
# ADuss 2018-07-27

if [ $USER != "root" ]; then
    echo "ERROR: Must be run with sudo"
    exit 1
fi


# Set $INSTALL var
if [ $1 == "zypper" ]; then
    zypper refresh
    INSTALL="zypper install -y "
elif [ $1 == "apt" ]; then
    apt-get update
    INSTALL="apt-get install -y "
else
    echo "Usage: init-script <PKGMANAGER>"
    exit 1
fi


# BUILD UTILS
echo "#### Installing Build Utilities ####"
$INSTALL make gcc curl


# BASH PROFILE
echo "##### Updating Bash Profile #####"
curl -o /home/$SUDO_USER/.bash_profile https://raw.githubusercontent.com/mindovermiles262/dots/master/bash/bash_profile
source /home/$SUDO_USER/.bash_profile


# GIT
# Must be kept before VIM
echo "##### Installing Git #####"
$INSTALL git


# VIM
echo "##### Installing VIM #####"
curl -fLo /home/$SUDO_USER/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o /home/$SUDO_USER/.vimrc https://raw.githubusercontent.com/mindovermiles262/dots/master/vim/vimrc
vim +PlugInstall +qall
chown -R $SUDO_USER:users /home/$SUDO_USER/.vimrc /home/$SUDO_USER/.vim


# REDSHIFT
echo "##### Installing Redshift #####"
$INSTALL redshift
gsettings set org.gnome.system.location enabled true
curl -o /home/$SUDO_USER/.config/redshift.conf https://raw.githubusercontent.com/mindovermiles262/scripts/master/Conf/redshift.conf

