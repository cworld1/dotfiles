status is-interactive; or return

# Fzf integration
set -gx FZF_DEFAULT_OPTS '--height 75% --layout=reverse --info=inline'
fzf --fish | source
