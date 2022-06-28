#!/bin/sh

CURRENT=`pwd`

# create symbolic link
ln -s $CURRENT/vim/lucario.vim ~/.vim/colors/lucario.vim
ln -s $CURRENT/vim/vimrc ~/.vimrc
ln -s $CURRENT/zsh/zshrc ~/.zshrc
ln -s $CURRENT/zsh/zprofile ~/.zprofile
ln -s $CURRENT/git/gitconfig ~/.gitconfig
ln -s $CURRENT/git/gitignore_global ~/.gitignore_global