# dotfiles

* I use this on mint & Ubuntu & macOS.
* The setup script was checked with [\[ShellCheck\]](https://open-vsx.org/extension/timonwong/shellcheck).
* License: **MIT**


## My environment

* Shell: fish 4.x
* Editor: VSCodium
* Python manager: pyenv (+ poetry, uv)


## How to setup

* Set dotfiles by GNU stow.

```sh
git clone https://gitlab.com/f-matano44/dotfiles.git
cd dotfiles/
stow fish git vim xmodmap
```

* Set gitconfig_local (for gpg signing)

```sh
touch "$HOME"/.gitconfig_local
ln -s "$HOME"/.gitconfig_local path/to/dotfiles/git/.gitconfig_local
```

## How to setup WINE

```sh
WINEARCH=win32 wineboot
winetricks --self-update
```

## How to setup xmodmap

* Add below command to "Startup Applications"

```sh
sh -c "sleep 10 && xmodmap ~/.xmodmap"
```

* default value of Ubuntu 24.04

```
keycode 108 = Alt_R Meta_R Alt_R Meta_R
```

## 3rd party notice

* [\[Lucario By Raphael Amorim\]](https://github.com/raphamorim/lucario)
    * LICENSE: MIT License
    * dotfiles/vim/lucario.vim, gnome-terminal/lucario.sh

* [\[【詳解】モテたいVimmer必見　快適にコーディングするためのvimrc解説 By ahiruman5\]](https://qiita.com/ahiruman5/items/4f3c845500c172a02935)
    * LICENSE: Qiita 利用規約 第二章 第７条 3
    * vim/vimrc


## Reference(s)

* [\[株式会社エムケイシステム TECH BLOG M1 Mac の環境構築メモ\]](https://blog.mksc.jp/contents/apple-silicon/)
* [\[fishで「パスを通す」ための最終解答\]](https://zenn.dev/estra/articles/zenn-fish-add-path-final-answer)
