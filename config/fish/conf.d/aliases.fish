alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# System
alias rmf 'rm -rf' # force delete
alias tempcd 'mktemp -d | cd' # make temp dir & cd
alias mkdir 'mkdir -v -p'
function mkcd -d "Create and enter directory"
    mkdir -p $argv && cd $argv
end
alias wget 'wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# Shell
alias unset="set --erase"
alias :q exit
alias :Q exit
alias cls clear

# User
alias clean~ xdg-ninja
alias osfetch fastfetch
alias gitfetch onefetch
alias logfetch git-cliff
