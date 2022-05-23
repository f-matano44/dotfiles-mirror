#!/bin/sh

CURRENT=`pwd`

# download lucario
git clone https://github.com/f-matano44/lucario.git

# mkdir
mkdir vim && mkdir vim/colors

# create symbolic link
ln -s $CURRENT/lucario/colors/lucario.vim $CURRENT/vim/colors/lucario.vim
ln -s $CURRENT/vim ~/.vim
ln -s $CURRENT/vimrc ~/.vimrc
ln -s $CURRENT/zshrc ~/.zshrc
ln -s $CURRENT/zprofile ~/.zprofile
ln -s $CURRENT/gitconfig ~/.gitconfig
ln -s $CURRENT/gitignore_global ~/.gitignore_global