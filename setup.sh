#!/bin/sh

CURRENT=`pwd`

# create symbolic link
ln -s $CURRENT/vim ~/.vim
ln -s $CURRENT/vimrc ~/.vimrc
ln -s $CURRENT/zshrc ~/.zshrc
ln -s $CURRENT/zprofile ~/.zprofile
ln -s $CURRENT/gitconfig ~/.gitconfig
ln -s $CURRENT/gitignore_global ~/.gitignore_global