#!/bin/sh

## vim setup script.

sudo yum -y install vim-enhanced

# create backup directory
mkdir -p ~/.vim/tmp

# install git
sudo yum -y install git

# install dein (plugin manager).
# https://github.com/Shougo/dein.vim
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim

# install vundle
mkdir -p ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# link to ~/.vimrc
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
ln -s $SCRIPT_DIR/.vimrc ~/.vimrc
