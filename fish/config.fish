# Start timing
set fish_init_start (date +%s%N)

### Envs ###
set -x PATH $PATH $HOME/.local/bin/
set -x PATH $PATH $HOME/.local/share/pnpm/
# Set lan and proxy env
function setenv
    if [ $argv[1] = PATH ]
        # Replace colons and spaces with newlines
        set -gx PATH (echo $argv[2] | tr ': ' \n)
    else
        set -gx $argv
    end
end
source ~/.env

### Alias ###
# System
alias :q exit
alias cls clear
alias where whereis
alias rmf "rm -rf"
alias mkdir 'mkdir -v -p'
alias paci "sudo pacman -S"
alias pacr "sudo pacman -R"
alias pacu "sudo pacman -U"
# User
alias l "lsd -A"
alias ll "lsd -lA"
alias lt "lsd -A --tree"
alias py python
alias v nvim
alias nvi nvim
alias jo joshuto
alias gitfetch onefetch
alias osfetch neofetch
alias rg ripgrep
alias clean~ xdg-ninja
alias gitc "git clone"
alias parui "paru -S"
alias parur "paru -R"
alias paruc "paru -Yc"
alias cmc 'cmake . -G "MSYS Makefiles" -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
alias cmr 'cmake --build build && build/main'
alias clashr 'systemctl --user restart clash-meta.service'
alias clashs 'systemctl --user status clash-meta.service'
alias clashd 'firefox "http://127.0.0.1:9090/ui/#/"'
# Abbrs
abbr -a ... ../..
abbr -a .... ../../..

### Local func ###
# Change greeting with timing
function fish_greeting
    set fish_init_end (date +%s%N)
    printf "Fish started in %.2f ms.\n" (math "($fish_init_end - $fish_init_start) / 1000000")
end
# Prompt theme
set fish_prompt_pwd_dir_length 2
function fish_prompt
    set last_status $status
    printf "%sCWorld %s%s%s%s%s%s" \
        (set_color $fish_color_user) \
        (set_color $fish_color_command) (prompt_pwd) \
        (set_color $fish_color_quote) (fish_git_prompt) \
        (set_color (test $last_status -eq 0; and echo normal; or echo red)) " \$ "
end

### Custom func ###

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

# Proxy
set -x no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"
function pon
    set -Ux http_proxy "http://127.0.0.1:7890"
    set -Ux https_proxy $http_proxy
    echo "Proxy has been opened."
end
function poff
    set -e http_proxy
    set -e https_proxy
    echo "Proxy has been closed."
end
function pshow
    echo "HTTP proxy : $http_proxy"
    echo "HTTPs proxy: $http_proxy"
end

### External ###

# Zoxide: quick path jump tool
zoxide init fish | source
