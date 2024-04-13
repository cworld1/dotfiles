# Customize
# Brew
setenv HOMEBREW_API_DOMAIN "https://mirrors.bfsu.edu.cn/homebrew-bottles/api"
setenv HOMEBREW_BOTTLE_DOMAIN "https://mirrors.bfsu.edu.cn/homebrew-bottles"
setenv HOMEBREW_BREW_GIT_REMOTE "https://mirrors.bfsu.edu.cn/git/homebrew/brew.git"
setenv HOMEBREW_CORE_GIT_REMOTE "https://mirrors.bfsu.edu.cn/git/homebrew/homebrew-core.git"
setenv HOMEBREW_PIP_INDEX_URL "https://mirrors.bfsu.edu.cn/pypi/web/simple"

# System
setenv LANG en_US.UTF-8
setenv TERM xterm-256color
setenv EDITOR nvim

# Prevent trashes on the $HOME directory
setenv XDG_RUNTIME_DIR /run/user/$UID
setenv XDG_CACHE_HOME $HOME/.cache
setenv XDG_CONFIG_HOME $HOME/.config
setenv XDG_DATA_HOME $HOME/.local/share
setenv XDG_STATE_HOME $HOME/.local/state
# Bash
setenv HISTFILE "$XDG_STATE_HOME"/bash/history
# Less
setenv LESSHISTFILE "$XDG_STATE_HOME"/less/history
# Node
setenv NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
# NPM
setenv NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
# PNPM
setenv PNPM_HOME "$XDG_DATA_HOME"/pnpm
# Rust (cargo)
setenv CARGO_HOME "$XDG_DATA_HOME"/cargo
# Go
setenv GOPATH "$XDG_DATA_HOME"/go
# Tldr
setenv TLDR_CACHE_DIR "$XDG_CACHE_HOME"/tldr
