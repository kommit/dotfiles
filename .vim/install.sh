#!/bin/bash

cd $HOME
ln -sf .vim/.vimrc .
cd .vim
mkdir -p backup
mkdir -p swap
mkdir -p bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
