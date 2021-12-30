#!/bin/bash

exitflag=0

# If there is "./vimrc", recommend to remove.
if [ -e ~/.vimrc ]; then
    echo 'Error: ~/.vimrc is already exist.'
    echo 'Please remove this file.'
    echo 'Example: $ mv ~/.vimrc ~/.vimrc_old'
    echo ''
    exitflag=1
fi

# If there is "./vim", recommend to remove.
if [ -d ~/.vim ]; then
    echo 'Error: ~/.vim is already exist.'
    echo 'Please remove this directory.'
    echo 'Example: $ mv ~/.vim ~/.vim_old'
    echo ''
    exitflag=1
fi

# If "exitflag" is 1, exit of script.
if [ ${exitflag} -eq 1 ]; then
    exit 1
fi

if [ ! -d ~/.cache ]; then
    # create cache directory
    echo "mkdir ~/.cache"
    mkdir ~/.cache
fi

# create .vim directory
mkdir ~/.vim
mkdir ~/.vim/colors

# create symbolic link
cp ./data/vimrc ~/.vim/.vimrc
ln -s ~/.vim/.vimrc ~/.vimrc

# download lucario
if [ ! -d ~/.cache/lucario ]; then
    cd ~/.cache
    git clone https://github.com/raphamorim/lucario.git
else
    cd ~/.cache/lucario
    git config pull.rebase false
fi
cp ~/.cache/lucario/colors/lucario.vim ~/.vim/colors/


#--------------------------
echo 'Installation is complete!'
echo 'You must set color profile for terminal to lucario.'
echo ''
