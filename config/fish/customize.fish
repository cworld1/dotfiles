# [Basic]
# Prompt frefix
set prompt_prefix "" # command logo
# "": macOS     "": Windows  "": Android
# "": Archlinux "": Fedora   "": Ubuntu
# "": centOS    "": OpenSUSE "": Debian
# Proxy
set proxy "http://127.0.0.1:7890"
# set proxy $(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*'):7890 # for wsl
# Enable vi mode
source $fish_confs/fish_vi_mode.fish

# [Confs]
# Package manager
# source $fish_confs/pacman.fish
# source $fish_confs/pacman.fish msys # msys version
# source $fish_confs/scoop.fish
# source $fish_confs/homebrew.fish
# source $fish_confs/zerobrew.fish # another homebrew manager

# Languages
source $fish_confs/python.fish
# source $fish_confs/cmake.fish
# source $fish_confs/rust.fish

# Cli tools
source $fish_confs/git.fish
source $fish_confs/nvim.fish
# source $fish_confs/vscode.fish
# source $fish_confs/fzf.fish
# source $fish_confs/eza.fish
# source $fish_confs/yazi.fish
# source $fish_confs/zoxide.fish
# source $fish_confs/android.fish
# source $fish_confs/podman.fish
# source $fish_confs/zellij.fish

# Quick actions
# source $fish_confs/curl.fish

# [Others] sys detect
if test "$OS" = Windows_NT; or set -q MSYSTEM
  set -x OSTYPE windows
  status is-interactive; and source "$XDG_CONFIG_HOME"/fish/platform/windows.fish
else
  switch (uname)
    case Linux
      set -x OSTYPE linux
      status is-interactive; and source "$XDG_CONFIG_HOME"/fish/platform/linux.fish
    case Darwin
      set -x OSTYPE macos
      status is-interactive; and source "$XDG_CONFIG_HOME"/fish/platform/macos.fish
    case 'MSYS_NT*' 'MINGW*_NT*' 'CYGWIN_NT*'
      set -x OSTYPE windows
      status is-interactive; and source "$XDG_CONFIG_HOME"/fish/platform/windows.fish
    case '*'
      set -x OSTYPE unknown
  end
end
