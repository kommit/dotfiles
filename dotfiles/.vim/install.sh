#!/bin/bash

cd $HOME
ln -sf .vim/.vimrc .
cd .vim
mkdir -p backup
mkdir -p swap
mkdir -p bundle

# Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Vundle
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
