#!/bin/sh

CURRENT=`pwd`

# create symbolic link
ln -s $CURRENT/vim ~/.vim
ln -s $CURRENT/vimrc ~/.vimrc
ln -s $CURRENT/zshrc ~/.zshrc