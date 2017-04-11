#!/bin/sh

## vim setup script.

# create backup directory
mkdir ~/.vim/tmp

# install dein (plugin manager).
# https://github.com/Shougo/dein.vim
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
