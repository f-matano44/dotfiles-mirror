# dotfiles

I mainly use this repo on macOS (M1 chip) and Linux Mint (home-built).

## My environment

* Terminal emulator: Terminal.app (macOS) or xfce4-terminal (Linux)
* Shell: fish
* Editor: VSCodium + Codex
* Python management: uv + ruff + mypy
* Java management: Gradle

## Setup (GNU tools)

```sh
xargs -a stow_targets.txt stow
bash setup_codium.bash
```

## Third-party notices

* [\[Lucario By Raphael Amorim\]](https://github.com/raphamorim/lucario)
  * LICENSE: [\[MIT License\]](https://opensource.org/license/MIT)
  * xfce/.local/share/xfce4/terminal/colorschemes/lucario.theme

* <https://github.com/github/gitignore>
  * LICENSE: [\[CC0\]](https://github.com/github/gitignore/blob/main/LICENSE)
  * git/.config/git/ignore
