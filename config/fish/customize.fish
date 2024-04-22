# Prompt frefix
set prompt_prefix "" # command logo
# "": macOS     "": Windows  "": Android
# "": Archlinux "": Fedora   "": Ubuntu
# "": centOS    "": OpenSUSE

# Proxy
set hostip "127.0.0.1"
# set hostip $(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*') # for wsl

# Zoxide: quick path jump tool
zoxide init fish | source
# Quick edit (with zoxide & nvim)
function zv
    z $argv; and nvim .
end

# Fzf integration
fzf --fish | source

# Yazi
function yy # to change the current working directory when exiting yazi
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
complete -c yazi -l cwd-file -d 'Write the cwd on exit to this file' -r -F
complete -c yazi -l chooser-file -d 'Write the selected files on open emitted by the chooser mode' -r -F
complete -c yazi -l clear-cache -d 'Clear the cache directory'
complete -c yazi -l debug -d 'Print debug information'
complete -c yazi -s V -l version -d 'Print version'
complete -c yazi -s h -l help -d 'Print help'

# Venv auto actiavation
function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
    status --is-command-substitution; and return
    # Check if we are inside a git directory
    if git rev-parse --show-toplevel &>/dev/null
        set gitdir (realpath (git rev-parse --show-toplevel))
    else
        set gitdir ""
    end
    # If venv is not activated or a different venv is activated and venv exist.
    if test "$VIRTUAL_ENV" != "$gitdir/.venv" -a -e "$gitdir/.venv/bin/activate.fish"
        source $gitdir/.venv/bin/activate.fish
        # If venv activated but the current (git) dir has no venv.
    else if not test -z "$VIRTUAL_ENV" -o -e "$gitdir/.venv"
        deactivate
    end
end
