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
- [lazygit](https://github.com/jesseduffield/lazygit) (go)
- [pip](https://github.com/pypa/pip) (python)
- [python](https://github.com/python/cpython) (python)
- surfingkeys (chrome/edge/firefox plugin)
- [yazi](https://github.com/sxyazi/yazi) (rust)

Extra fish shell configs for:

- [cmake](https://github.com/Kitware/CMake) (c)
- [eza](https://github.com/eza-community/eza) (rust)
- [fzf](https://github.com/junegunn/fzf) (go)
- [homebrew](https://github.com/Homebrew/brew) (ruby)
- [neovim](https://github.com/neovim/neovim) (vimscript)
- [pacman](https://gitlab.archlinux.org/pacman/pacman) (c)
- [pnpm](https://github.com/pnpm/pnpm) (typescript)
- [rust](https://github.com/rust-lang/rust) (rust)
- [scoop](https://github.com/ScoopInstaller/Scoop) (powershell)
- [vscode](https://github.com/microsoft/vscode) (typescript)
- [zoxide](https://github.com/ajeetdsouza/zoxide) (rust)

If you don't want to use any of them:

- Delete it or move to another path from the `config` folder before running `install.sh`.
- Or just skip creating link to it.

## Recommend packages

Config of [neovim](https://github.com/neovim/neovim) config is a little complex. I choose to make configs in another repo [nvim-config](https://github.com/cworld1/nvim-config/).

These packages don't need any configs, but I use it and having a good experiences.

- [fastfetch](https://github.com/fastfetch-cli/fastfetch) (c)
- [onefetch](https://github.com/o2sh/onefetch/) (rust)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (rust)
- [tldr](https://github.com/isacikgoz/tldr) (go interactive version)

## Installation

```shell
# For macOS or Linux
bash install.sh
# For Windows
pwsh install.ps1
```

> `install.sh` will help you create soft link to `$XDG_CONFIG_HOME` or `$HOME/.config`. If there exists conflicts, it will create backups automatically.

Other options:

- `-f` / `--force`: won't create `.bak` backups even the target path has the same folder. It may be useful for Windows ln link.
- `-h` / `--help`: display help.

## Known issues

- Windows fish shell by Msys(Cygwin) need its conf file `fish_variables` must be `lf` format. Otherwise it cannot find the right variables.
- Archlinux users are recommend to install: `dhcpcd less tree terminus-font`
