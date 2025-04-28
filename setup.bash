#!/bin/bash

set -euo pipefail

DOTFILES=$(pwd)

# make backup folder
TIMESTAMP=$(date +%Y%m%dT%H%M%S)
RANDOM_ID=$(printf "%08d" $(fish -c "random 0 99999999"))
BACKUP_FOLDER=${DOTFILES}/.backup/${TIMESTAMP}_${RANDOM_ID}
mkdir -p ${BACKUP_FOLDER}


# merge old backup folder
shopt -s nullglob dotglob
old_dirs=( ${DOTFILES}/old_*/ ${DOTFILES}/.old/*/ )
if (( ${#old_dirs[@]})); then
    mv -- ${old_dirs[@]} ${DOTFILES}/.backup/
fi
if [ -d ${DOTFILES}/.old ]; then
    rmdir ${DOTFILES}/.old
fi


# make dir
if [ ! -d ${HOME}/.vim/colors/ ]; then
    mkdir -p ${HOME}/.vim/colors/
fi
if [ ! -d ${HOME}/.config/fish/ ]; then
    mkdir -p ${HOME}/.config/fish/
fi


# create symbolic link
## lucario
if [ -f ${HOME}/.vim/colors/lucario.vim ]; then
    mv ${HOME}/.vim/colors/lucario.vim ${BACKUP_FOLDER}/lucario.vim
fi
ln -s ${DOTFILES}/vim/lucario.vim ${HOME}/.vim/colors/lucario.vim
## vimrc
if [ -f "${HOME}/.vimrc" ]; then
    mv ${HOME}/.vimrc ${BACKUP_FOLDER}/vimrc
fi
ln -s ${DOTFILES}/vim/vimrc ${HOME}/.vimrc
## gitconfig
if [ -f "${HOME}/.gitconfig" ]; then
    mv ${HOME}/.gitconfig ${BACKUP_FOLDER}/gitconfig
fi
ln -s ${DOTFILES}/git/gitconfig ${HOME}/.gitconfig
## gitconfig_local (for gpg signing)
touch ${HOME}/.gitconfig_local
ln -sfn ${HOME}/.gitconfig_local ${DOTFILES}/git/gitconfig_local
## gitignore_global
if [ -f "${HOME}/.gitignore_global" ]; then
    mv ${HOME}/.gitignore_global ${BACKUP_FOLDER}/gitignore_global
fi
ln -s ${DOTFILES}/git/gitignore_global ${HOME}/.gitignore_global
## fish_config
if [ -f "${HOME}/.config/fish/config.fish" ]; then
    mv ${HOME}/.config/fish/config.fish ${BACKUP_FOLDER}/config.fish
fi
ln -s ${DOTFILES}/fish/config.fish ${HOME}/.config/fish/config.fish
## vscodium
OS=$(uname)
if [ "$OS" = "Darwin" ]; then
    if [ -f "${HOME}/Library/Application Support/VSCodium/User/settings.json" ]; then
        mv "${HOME}/Library/Application Support/VSCodium/User/settings.json" \
            ${BACKUP_FOLDER}/codium_config.json
    fi
    ln -s ${DOTFILES}/vscodium/settings.json \
        "${HOME}/Library/Application Support/VSCodium/User/settings.json"
elif [ "$OS" = "Linux" ]; then
    if [ -f "${HOME}/.config/VSCodium/User/settings.json" ]; then
        mv "${HOME}/.config/VSCodium/User/settings.json" \
            ${BACKUP_FOLDER}/codium_config.json
    fi
    ln -s ${DOTFILES}/vscodium/settings.json \
        "${HOME}/.config/VSCodium/User/settings.json"
else
    echo "Unsupported OS: $OS"
fi


# install codium extension
extensionID=(
    "ms-python.black-formatter"
    "pixl-garden.BongoCat"
    # "shengchen.vscode-checkstyle"
    "streetsidesoftware.code-spell-checker"
    "janisdd.vscode-edit-csv"
    "usernamehw.errorlens"
    "tamasfe.even-better-toml"
    "bmalehorn.vscode-fish"
    "ms-python.flake8"
    "eamodio.gitlens"
    "oderwat.indent-rainbow"
    "ms-python.isort"
    "MS-CEINTL.vscode-language-pack-ja"
    "wmanth.jar-viewer"
    "ms-toolsai.jupyter"
    "ms-toolsai.vscode-jupyter-cell-tags"
    "ms-toolsai.jupyter-keymap"
    "ms-toolsai.jupyter-renderers"
    "ms-toolsai.vscode-jupyter-slideshow"
    "redhat.java"
    "ritwickdey.LiveServer"
    "ms-python.mypy-type-checker"
    "OrhunUlusahin.praatvscode"
    "ms-python.python"
    "ms-python.debugpy"
    "mechatroner.rainbow-csv"
    "redhat.fabric8-analytics"
    "jock.svg"
    "vscode-icons-team.vscode-icons"
    "tomoki1207.pdf"
)
for extID in ${extensionID[@]}; do
    codium --install-extension ${extID}
done
