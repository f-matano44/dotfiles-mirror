# dotfiles

* I use this on mint & Ubuntu & macOS.

## My environment

* Shell: fish
* Editor: VSCodium
* Python manager: uv (+ python-is-python3)

## How to setup

* Set dotfiles by GNU stow.

```sh
git clone https://gitlab.com/f-matano44/dotfiles.git
cd dotfiles/
stow codex fish git xfce xmodmap
```

## How to setup WINE

```sh
WINEARCH=win32 wineboot
winetricks --self-update
```

## How to setup xmodmap

* Add below command to "Startup Applications"

```sh
sh -c "sleep 10 && xmodmap ~/.config/xmodmap"
```

## 3rd party notice

* [\[Lucario By Raphael Amorim\]](https://github.com/raphamorim/lucario)
  * LICENSE: MIT License
  * xfce/.local/share/xfce4/terminal/colorschemes/lucario.theme

* <https://github.com/github/gitignore>
  * LICENSE: CC0
  * git/.config/git/ignore

## Reference(s)

* [\[株式会社エムケイシステム TECH BLOG M1 Mac の環境構築メモ\]](https://blog.mksc.jp/contents/apple-silicon/)

* [\[fishで「パスを通す」ための最終解答\]](https://zenn.dev/estra/articles/zenn-fish-add-path-final-answer)
