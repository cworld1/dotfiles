alias g git
# Git add & reset & status
alias ga 'git add --verbose'
alias gaa 'git add --all' # add all
alias gapa 'git add --patch' # add with interaction
alias grh 'git reset'
alias grhh 'git reset --hard'
alias gs 'git status'
alias gss 'git status --short'
# Git branch & checkout
alias gb 'git branch --all --verbose' # list branches
alias gcb 'git checkout -b' # new branch & checkout
alias gcm 'git checkout main'
alias gcd 'git checkout dev'
alias gcr 'git checkout release'
# Git commit
alias gcmsg 'git commit -m'
alias gc 'git commit --verbose' # use editor
alias gc! 'git commit --amend --verbose' # modify last commit
# Git clone
alias gcl 'git clone'
alias gcls 'git clone --recurse-submodules' # with submodules
# Git fetch
alias gf 'git fetch'
alias gfa 'git fetch --all --prune' # fetch all & clean
# Git pull & push
alias gp 'git pull'
alias gP 'git push'
# Git log & show & diff
alias gl 'git log'
alias glg 'git log --stat' # include file status
alias glgp 'git log --stat --patch' # include diff
alias glgg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) -%C(bold yellow)%d%C(reset) %C(white)%s%C(reset) %C(bold green)(%ar)%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gsh 'git show'
alias gd 'git diff'
# Git rebase & merge & cherry-pick
alias grb 'git rebase'
alias gm 'git merge'
alias gcp 'git cherry-pick'
# Git stash
alias gsta 'git stash push'
alias gstp 'git stash pop'
alias gstl 'git stash list'
alias gsts 'git stash show --text' # show diff
alias gstd 'git stash drop'
alias gstc 'git stash clear' # clean all
