# Dotfiles

Dotfiles of CWorld.

For Arch Linux dotfiles, check the [`archlinux` branch](https://github.com/cworld1/dotfiles/tree/archlinux) for more.

## Support platform

- macOS (recommend)
- Windows with msys
- Universal linux

## Support packages

Config files contains configs of the following packages:

- [podman](https://github.com/containers/podman) (go)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch) (c)
- [fish](https://github.com/fish-shell/fish-shell) (rust)
- [git](https://github.com/git/git) (c)
- [pip](https://github.com/pypa/pip) (python)
- [python](https://github.com/python/cpython) (python)
- [surfingkeys](https://github.com/brookhong/Surfingkeys) (chrome/edge/firefox plugin)
- [yazi](https://github.com/sxyazi/yazi) (rust)
- [zellij](https://github.com/zellij-org/zellij) ([zjstatus](https://github.com/dj95/zjstatus)) (rust)

If you don't want to use any of them, just skip creating link to it.

- Delete it or move to another path from the `config` folder before running `install.sh`.

Extra fish shell configs for:

- [cmake](https://github.com/Kitware/CMake) (c)
- [eza](https://github.com/eza-community/eza) (rust)
- [fzf](https://github.com/junegunn/fzf) (go)
- [git](https://github.com/git/git) (c)
- [homebrew](https://github.com/Homebrew/brew) (ruby)
- [jj](https://www.jj-vcs.dev/latest/) (rust)
- [neovim](https://github.com/neovim/neovim) (vimscript)
- [pacman](https://gitlab.archlinux.org/pacman/pacman) (c)
- pass
- [pnpm](https://github.com/pnpm/pnpm) (typescript)
- [podman](https://github.com/containers/podman) (go)
- [python](https://github.com/python/cpython) (python)
- [rust](https://github.com/rust-lang/rust) (rust)
- [scoop](https://github.com/ScoopInstaller/Scoop) (powershell)
- [vscode](https://github.com/microsoft/vscode) (typescript)
- [yazi](https://github.com/sxyazi/yazi) (rust)
- [zellij](https://github.com/zellij-org/zellij) ([zjstatus](https://github.com/dj95/zjstatus)) (rust)
- [zoxide](https://github.com/ajeetdsouza/zoxide) (rust)

You can enable them by uncomment line in `<fishconfig>/custom.fish`.

## Recommend packages

Config of [neovim](https://github.com/neovim/neovim) config is a little complex. I choose to make configs in another repo [nvim-config](https://github.com/cworld1/nvim-config/).

These packages don't need any configs, but I use it and having a good experiences.

- [onefetch](https://github.com/o2sh/onefetch/) (rust)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (rust)
- [tldr](https://github.com/isacikgoz/tldr) (go interactive version)

## Installation

```shell
# For macOS or Linux
bash install.sh
# For Windows
pwsh install.ps1

# Or only link the specific directory
bash install.sh fish
```

> `install.sh` will help you create soft link to `$XDG_CONFIG_HOME` or `$HOME/.config`. If there exists conflicts, it will create backups automatically.

Other options:

- `-f` / `--force`: won't create `.bak` backups even the target path has the same folder. It may be useful for Windows ln link.
- `-h` / `--help`: display help.

## Known issues

- Windows fish shell by Msys(Cygwin) need its conf file `fish_variables` must be `lf` format. Otherwise it cannot find the right variables.
- Archlinux users are recommend to install: `dhcpcd less tree terminus-font`
