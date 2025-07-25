#!/usr/bin/env bash

set -euo pipefail


OS=$(uname)
if [ "$OS" = "Darwin" ]; then
    if [ -f "$HOME/Library/Application Support/VSCodium/User/settings.json" ]; then
        mv "$HOME/Library/Application Support/VSCodium/User/settings.json" \
            "$BACKUP_FOLDER"/codium_config.json
    fi
    ln -s "$DOTFILES"/vscodium/settings.json \
        "$HOME/Library/Application Support/VSCodium/User/settings.json"
elif [ "$OS" = "Linux" ]; then
    if [ -f "$HOME"/.config/VSCodium/User/settings.json ]; then
        mv "$HOME"/.config/VSCodium/User/settings.json \
            "$BACKUP_FOLDER"/codium_config.json
    fi
    ln -s "$DOTFILES"/vscodium/settings.json \
        "$HOME"/.config/VSCodium/User/settings.json
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
for extID in "${extensionID[@]}"; do
    codium --install-extension "$extID"
done
