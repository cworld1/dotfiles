# Prompt frefix
set prompt_prefix "" # command logo
# "": macOS     "": Windows  "": Android
# "": Archlinux "": Fedora   "": Ubuntu
# "": centOS    "": OpenSUSE

# Proxy
set proxy "http://127.0.0.1:7890"
# set proxy $(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*'):7890 # for wsl

# Fish enable vi mode
source $fish_confs/vi_mode.fish

# Package manager
# source $fish_confs/pacman.fish
# source $fish_confs/scoop.fish
# source $fish_confs/homebrew.fish

# Programming
source $fish_confs/git.fish
# source $fish_confs/vscode.fish
source $fish_confs/nvim.fish

# Languages
# source $fish_confs/cmake.fish
# source $fish_confs/rust.fish
# source $fish_confs/pnpm.fish
# source $fish_confs/python.fish

# Cli tools
# source $fish_confs/fzf.fish
# source $fish_confs/eza.fish
# source $fish_confs/pass.fish
# source $fish_confs/podman.fish
# source $fish_confs/yazi.fish
# source $fish_confs/zoxide.fish

switch (uname)
    case Linux
        set -x OSTYPE linux
    case Darwin
        set -x OSTYPE macos
    case 'MSYS_NT*'
        set -x OSTYPE windows
        alias open explorer
    case '*'
        set -x OSTYPE unknown
end
