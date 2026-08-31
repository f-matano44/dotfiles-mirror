# Dotfiles

I mainly use this repo on macOS and Linux Mint.

## My environment

* Terminal (macOS): Terminal.app
* Terminal (Linux): xfce4-terminal
* Shell: fish
* Editor: VSCodium + Codex
* Python management: uv + ruff + mypy
* Java management: Gradle

## Setup

Requires GNU Stow and GNU findutils.

```sh
xargs -a stow_targets.txt stow
bash setup_codium.bash
```

### Disable unused keys on Linux

#### Desktop

On Ubuntu 20.04–24.04, add the PPA first:

```sh
sudo add-apt-repository ppa:keyd-team/ppa
sudo apt update
```

```sh
sudo apt install keyd
sudo install -Dm644 keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
```

#### MouseComputer G4I7U01BKABA laptop

Install the model-specific udev configuration instead of using `keyd`.

```sh
sudo install -Dm644 \
  udev/90-mousecomputer-g4i7u01bkaba-keyboard.hwdb \
  /etc/udev/hwdb.d/90-mousecomputer-g4i7u01bkaba-keyboard.hwdb
sudo systemd-hwdb update
sudo udevadm trigger --subsystem-match=input --action=change
sudo systemctl disable --now keyd
```

## Third-party notices

* [\[Lucario By Raphael Amorim\]](https://github.com/raphamorim/lucario)
  * LICENSE: [\[MIT License\]](https://opensource.org/license/MIT)
  * xfce/.local/share/xfce4/terminal/colorschemes/lucario.theme

* <https://github.com/github/gitignore>
  * LICENSE: [\[CC0\]](https://github.com/github/gitignore/blob/main/LICENSE)
  * git/.config/git/ignore
