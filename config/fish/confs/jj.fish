complete -e -c jj
jj util completion fish | source

# [Alias]
# Inspect
alias jl 'jj log -r ::'
# alias jl 'jj log -r ..' # include root node
alias js 'jj status'
alias jc 'jj split'
# Commit
alias jbs 'jj bookmark set'
alias jbS 'jj bookmark set -r @-'
alias jP 'jj git push'
alias jf 'jj git fetch'
# Edit
alias je 'jj edit'
