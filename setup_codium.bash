#!/usr/bin/env bash

set -euo pipefail

DOTFILES=$(pwd)

# make backup folder
TIMESTAMP=$(date +%Y%m%dT%H%M%S)
RANDOM_ID=$(printf "%08d" "$(fish -c 'random 0 99999999')")
BACKUP_FOLDER="$DOTFILES"/.backup/"$TIMESTAMP"_"$RANDOM_ID"
mkdir -p "$BACKUP_FOLDER"


# merge old backup folder
shopt -s nullglob dotglob
old_dirs=( "$DOTFILES"/old_*/ "$DOTFILES"/.old/*/ )
if (( ${#old_dirs[@]})); then
    mv -- "${old_dirs[@]}" "$DOTFILES"/.backup/
fi
if [ -d "$DOTFILES"/.old ]; then
    rmdir "$DOTFILES"/.old
fi


# Set Destination
OS=$(uname)
SETTINGS_SOURCE="$DOTFILES/vscodium/settings.json"
CSPELL_SOURCE="$DOTFILES/vscodium/cspell.json"
if [ "$OS" = "Darwin" ]; then
    SETTINGS_DEST="$HOME/Library/Application Support/VSCodium/User/settings.json"
    CSPELL_DEST="$HOME/.config/cspell.json"
elif [ "$OS" = "Linux" ]; then
    SETTINGS_DEST="$HOME/.config/VSCodium/User/settings.json"
    CSPELL_DEST="$HOME/.config/cspell.json"
else
    echo "Unsupported OS: $OS"
    exit 1
fi


# Set Symbolic link
if [ -f "$SETTINGS_DEST" ]; then
    mv "$SETTINGS_DEST" "$BACKUP_FOLDER"/codium_config.json
fi
if [ -f "$CSPELL_DEST" ]; then
    mv "$CSPELL_DEST" "$BACKUP_FOLDER"/cspell.json
fi
ln -s "$SETTINGS_SOURCE" "$SETTINGS_DEST"
ln -s "$CSPELL_SOURCE" "$CSPELL_DEST"


# install codium extension
extensionID=(
    "pixl-garden.BongoCat"
    # "shengchen.vscode-checkstyle"
    "streetsidesoftware.code-spell-checker"
    "openai.chatgpt"
    "janisdd.vscode-edit-csv"
    "usernamehw.errorlens"
    "tamasfe.even-better-toml"
    "bmalehorn.vscode-fish"
    "eamodio.gitlens"
    "oderwat.indent-rainbow"
    "MS-CEINTL.vscode-language-pack-ja"
    "wmanth.jar-viewer"
    "ms-toolsai.jupyter"
    "ms-toolsai.vscode-jupyter-cell-tags"
    "ms-toolsai.jupyter-keymap"
    "ms-toolsai.jupyter-renderers"
    "ms-toolsai.vscode-jupyter-slideshow"
    "redhat.java"
    "James-Yu.latex-workshop"
    # "MathWorks.language-matlab"
    "ms-python.mypy-type-checker"
    "OrhunUlusahin.praatvscode"
    "ms-python.python"
    "ms-python.debugpy"
    "mechatroner.rainbow-csv"
    "redhat.fabric8-analytics"
    "charliermarsh.ruff"
    "timonwong.shellcheck"
    "richie5um2.vscode-sort-json"
    "jock.svg"
    "vscode-icons-team.vscode-icons"
    "redhat.vscode-yaml"
)
for extID in "${extensionID[@]}"; do
    codium --install-extension "$extID"
done
