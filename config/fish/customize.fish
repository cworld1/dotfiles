# Prompt frefix
set prompt_prefix "" # command logo
# "": macOS     "": Windows  "": Android
# "": Archlinux "": Fedora   "": Ubuntu
# "": centOS    "": OpenSUSE

# Proxy
set hostip "127.0.0.1"
# set hostip $(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*') # for wsl


# Package manager
source $fish_confs/homebrew.fish
#source ./confs/scoop.fish
#source ./confs/pacman.fish

# Cli tools
source $fish_confs/fzf.fish
source $fish_confs/git.fish
source $fish_confs/lsd.fish
source $fish_confs/nvim.fish
source $fish_confs/yazi.fish
source $fish_confs/zoxide.fish

# Programming
source $fish_confs/cmake.fish
source $fish_confs/pnpm.fish
source $fish_confs/python.fish
source $fish_confs/rust.fish
