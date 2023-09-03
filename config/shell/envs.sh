setenv LANG en_US.UTF-8
setenv TERM xterm-256color
setenv EDITOR nvim

# Config
setenv GPG_TTY $(tty)

# Prevent trashes on the $HOME directory
setenv XDG_CACHE_HOME $HOME/.cache
setenv XDG_CONFIG_HOME $HOME/.config
setenv XDG_DATA_HOME $HOME/.local/share
setenv XDG_STATE_HOME $HOME/.local/state
# Bash
setenv HISTFILE "$XDG_STATE_HOME"/bash/history
# Python
setenv PYTHONSTARTUP "/etc/python/pythonrc"
# NPM
setenv NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
# PNPM
setenv PNPM_HOME "$XDG_DATA_HOME"/pnpm
# Wine
setenv WINEPREFIX "$XDG_DATA_HOME"/wine
