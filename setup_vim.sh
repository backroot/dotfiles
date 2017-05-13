#!/bin/sh

## vim setup script.

sudo yum -y install vim-enhanced

# create backup directory
sudo mkdir ~/.vim/tmp

# install git
sudo yum -y install git

# install dein (plugin manager).
# https://github.com/Shougo/dein.vim
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim

# link to ~/.vimrc
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
ln -s $SCRIPT_DIR/.vimrc ~/.vimrc
