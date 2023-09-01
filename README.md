# Dotfiles

Dotfiles of CWorld.

## Screenshots

![Alt text](docs/Screenshot_2023-09-01-15-50-48_1476x830.png)

![Alt text](docs/Screenshot_2023-09-01-15-46-17_1476x830.png)

![Alt text](docs/Screenshot_2023-09-01-15-47-40_1476x830.png)

![Alt text](docs/Screenshot_2023-09-01-15-48-23_1476x830.png)

# Installation

Config files contains configs of the following packages:

- fcitx5 & fcitx5-chinese-addons (Also support rime)
- fish
- git
- hyprland
- hyprpaper
- joshuto
- neofetch
- rofi
- surfingkeys (firefox plugin)
- swaylock-effects
- swaync
- wezterm
- vscode (only flag)
- electron (only flag)

If you don't want to use any of them, delete it or move to another path before running `install.sh`.

> `install.sh` will help you create soft link to `$XDG_CONFIG_HOME` or `$HOME/.config`. If there exists conflicts, it will create backups automatically.
