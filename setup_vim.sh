#!/bin/sh

## vim setup script for centos 6 or 7.

# Installing packages for vim
sudo yum -y install vim-enhanced git python-setuptools

# Installing python jedi for jedi-vim
# https://github.com/davidhalter/jedi-vim
sudo easy_install pip
sudo pip install jedi

# create backup directory
mkdir -p ~/.vim/tmp

# installing dein (plugin manager).
# https://github.com/Shougo/dein.vim
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim

# installing vundle for jedi-vim
# https://github.com/VundleVim/Vundle.vim
mkdir -p ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# link to ~/.vimrc
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
ln -s $SCRIPT_DIR/.vimrc ~/.vimrc
