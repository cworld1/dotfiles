# Dotfiles

Dotfiles of CWorld.

For Arch Linux dotfiles, check the [`archlinux` branch](https://github.com/cworld1/dotfiles/tree/archlinux) for more.

## Support platform

- macOS (recommend)
- Windows with msys
- Universal linux

## Support packages

Config files contains configs of the following packages:

- [fastfetch](https://github.com/fastfetch-cli/fastfetch) (c)
- [fish](https://github.com/fish-shell/fish-shell) (rust)
- [git](https://github.com/git/git) (c)
- [gitui](https://github.com/extrawurst/gitui) (rust)
- [pip](https://github.com/pypa/pip) (python)
- universal shell configs
- surfingkeys (chrome/edge/firefox plugin)
- [yazi](https://github.com/sxyazi/yazi) (rust)

If you don't want to use any of them:

- Delete it or move to another path from the `config` folder before running `install.sh`.
- Or just skip creating link to it.

## Recommend packages

Config of [neovim](https://github.com/neovim/neovim) config is a little complex. I choose to make configs in another repo [nvim-config](https://github.com/cworld1/nvim-config/).

These packages don't need any configs, but I use it and having a good experiences.

- [tldr](https://github.com/isacikgoz/tldr) (go interactive version)
- [zoxide](https://github.com/ajeetdsouza/zoxide) (rust)
- [lsd](https://github.com/lsd-rs/lsd) (rust)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (rust)
- [fzf](https://github.com/junegunn/fzf) (go)

## Installation

```shell
bash install.sh
```

> `install.sh` will help you create soft link to `$XDG_CONFIG_HOME` or `$HOME/.config`. If there exists conflicts, it will create backups automatically.

Other options:

- `-f` / `--force`: won't create `.bak` backups even the target path has the same folder. It may be useful for Windows ln link.
- `-h` / `--help`: display help.

## Known issues

- Windows fish shell by Msys(Cygwin) need its conf file `fish_variables` must be `lf` format. Otherwise it cannot find the right variables.
- Archlinux users are recommend to install: `dhcpcd less tree terminus-font`
