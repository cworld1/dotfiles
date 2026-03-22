# [Basic]
# Prompt frefix
set prompt_prefix "" # command logo
# "": macOS     "": Windows  "": Android
# "": Archlinux "": Fedora   "": Ubuntu
# "": centOS    "": OpenSUSE
# "": centOS    "": OpenSUSE "": Debian

# Proxy
set proxy "http://127.0.0.1:7890"
# set proxy $(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*'):7890 # for wsl
# Fish enable vi mode
source $fish_confs/vi_mode.fish

# [Confs]
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
# source $fish_confs/jj.fish

# [Others] sys detect
switch (uname)
  case Linux
    set -x OSTYPE linux
alias copy xclip
    alias trash 'gio trash'
  case Darwin
    set -x OSTYPE macos
alias copy pbcopy
    function trash -d "Move files to trash on macOS"
      for arg in $argv
        set -l file (realpath "$arg")
        /usr/bin/osascript -e "tell application \"Finder\" to delete POSIX file \"$file\"" >/dev/null
      end
    end
  case 'MSYS_NT*'
    set -x OSTYPE windows
    source "$XDG_CONFIG_HOME"/fish/platform/windows.fish
  case '*'
    set -x OSTYPE unknown
end
