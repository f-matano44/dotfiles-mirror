# Dotfiles

I mainly use this repo on macOS and Linux Mint.

## My environment

* Terminal (macOS): Terminal.app
* Terminal (Linux): xfce4-terminal
* Shell: fish
* Editor: VSCodium + Codex
* Python management: uv + ruff + mypy
* Java management: Gradle

## Setup (GNU stow + findutils)

```sh
xargs -a stow_targets.txt stow
bash setup_codium.bash
```

### Disable unused keys (Linux)

Install `keyd`. Ubuntu 25.10 or later provides it in the `universe` repository.

```sh
sudo apt install keyd
```

On Ubuntu 20.04 through 24.04, use the upstream packaging team's PPA first.

```sh
sudo add-apt-repository ppa:keyd-team/ppa
sudo apt update
sudo apt install keyd
```

Install the configuration and start the daemon.

```sh
sudo install -Dm644 keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
```

The Debian/Ubuntu package renames the command to `keyd.rvaiya` to avoid a
name conflict with another package. The service name remains `keyd`.

```sh
sudo keyd.rvaiya monitor
```

## Third-party notices

* [\[Lucario By Raphael Amorim\]](https://github.com/raphamorim/lucario)
  * LICENSE: [\[MIT License\]](https://opensource.org/license/MIT)
  * xfce/.local/share/xfce4/terminal/colorschemes/lucario.theme

* <https://github.com/github/gitignore>
  * LICENSE: [\[CC0\]](https://github.com/github/gitignore/blob/main/LICENSE)
  * git/.config/git/ignore
