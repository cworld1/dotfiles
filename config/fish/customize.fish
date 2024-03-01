# Prompt frefix
set prompt_prefix "󰀵" # command logo

# Proxy
set hostip "127.0.0.1"
# set hostip $(cat /etc/resolv.conf | grep -oP '(?<=nameserver\ ).*') # for wsl

# Yazi: to change the current working directory when exiting Yazi.
function ya
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Zoxide: quick path jump tool
zoxide init fish | source

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
