# dotfiles

* I use this on mint & Ubuntu & macOS.
* The setup script was checked with [\[ShellCheck\]](https://open-vsx.org/extension/timonwong/shellcheck).
* License: **MIT**


## My environment

* Shell: fish 4.x
* Editor: vscodium
* Java (macOS): version 21
* Python manager: pyenv


## How to setup

```sh
cd "$HOME"
git clone https://gitlab.com/f-matano44/dotfiles.git
cd dotfiles/ && bash setup.bash
```

## How to setup WINE

```sh
WINEARCH=win32 wineboot
winetricks --self-update
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
