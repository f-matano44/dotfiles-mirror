#!/bin/sh

set -e

CURRENT=`pwd`

# make trush
date_str=$(date +%Y%m%d%H%M%S)
random_str=$(LC_ALL=C tr -dc 'a-zA-Z0-9' < /dev/random | fold -w 8 | head -n 1)
date_ramdom=old_${date_str}_${random_str}
mkdir ${CURRENT}/${date_ramdom}

# make dir
if [ ! -d ${HOME}/.vim/colors ]; then
    mkdir -p ${HOME}/.vim/colors
fi
if [ ! -d ${HOME}/.vim/colors ]; then
    mkdir -p ${HOME}/.config/fish/
fi

# create symbolic link
## lucario
if [ -f ${HOME}/.vim/colors/lucario.vim ]; then
    mv ${HOME}/.vim/colors/lucario.vim ${date_ramdom}/lucario.vim
fi
ln -s ${CURRENT}/vim/lucario.vim ${HOME}/.vim/colors/lucario.vim
## vimrc
if [ -f "${HOME}/.vimrc" ]; then
    mv ${HOME}/.vimrc ${date_ramdom}/vimrc
fi
ln -s ${CURRENT}/vim/vimrc ${HOME}/.vimrc
## gitconfig
if [ -f "${HOME}/.gitconfig" ]; then
    mv ${HOME}/.gitconfig ${date_ramdom}/gitconfig
fi
ln -s ${CURRENT}/git/gitconfig ${HOME}/.gitconfig
## gitignore_global
if [ -f "${HOME}/.gitignore_global" ]; then
    mv ${HOME}/.gitignore_global ${date_ramdom}/gitignore_global
fi
ln -s ${CURRENT}/git/gitignore_global ${HOME}/.gitignore_global
## fish_config
if [ -f "${HOME}/.config/fish/config.fish" ]; then
    mv ${HOME}/.config/fish/config.fish ${date_ramdom}/config.fish
fi
ln -s ${CURRENT}/fish/config.fish ${HOME}/.config/fish/config.fish
