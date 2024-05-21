set -gx NO_PROXY "localhost,127.0.0.1,localaddress,.localdomain.com"

# System
set -gx LANG en_US.UTF-8
set -gx TERM xterm-256color
set -gx EDITOR nvim

# Prevent trashes on the $HOME directory
set -gx XDG_RUNTIME_DIR /run/user/$UID
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

# Bash
set -gx HISTFILE "$XDG_STATE_HOME"/bash/history
# Less
set -gx LESSHISTFILE "$XDG_STATE_HOME"/less/history
# Node
set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
# PNPM
set -gx PNPM_HOME "$XDG_DATA_HOME"/pnpm
# Go
set -gx GOPATH "$XDG_DATA_HOME"/go
