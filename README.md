# Dotfiles

Dotfiles of CWorld.

For Arch Linux dotfiles, check the [`archlinux` branch](https://github.com/cworld1/dotfiles/tree/archlinux) for more.

## Support platform

- macOS (recommend)
- Windows with msys
- Universal linux

## Support packages

Config files contains configs of the following packages:

- fastfetch
- fish
- git
- gitui
- pip
- universal shell configs
- surfingkeys (chrome/edge/firefox plugin)
- tldr (rust version)
- yazi

If you don't want to use any of them, delete it or move to another path from the `config` folder before running `install.sh`.

## Installation

```shell
bash install.sh
```

> `install.sh` will help you create soft link to `$XDG_CONFIG_HOME` or `$HOME/.config`. If there exists conflicts, it will create backups automatically. You can use `-f` or `--force` to ignore backups.
