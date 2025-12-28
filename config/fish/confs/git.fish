alias g git
# Clone
alias gcl 'git clone'
alias gcls 'git clone --recurse-submodules'
# Status & add & reset
alias gs 'git status'
alias ga 'git add --verbose'
alias gaa 'git add --all'
alias grh 'git reset --hard'
# Commit
alias gc 'git commit --verbose'
alias gcmsg 'git commit -m'
alias gc! 'git commit --amend --verbose'
# Branch & checkout
alias gb 'git branch --all --verbose'
alias gc 'git checkout'
alias gcm 'git checkout main'
alias gcd 'git checkout dev'
# Remote
alias gf 'git fetch'
alias gfa 'git fetch --all --prune'
alias gp 'git pull'
alias gP 'git push'
# Inspect
alias gl 'git log --stat'
alias glg="git log --graph --abbrev-commit --decorate \
--format=format:'%C(bold blue)%h%C(reset) -%C(bold yellow)%d%C(reset) \
%C(white)%s%C(reset) %C(bold green)(%ar)%C(reset) \
%C(dim white)- %an%C(reset)' --all"
alias gsh 'git show'
alias gd 'git diff'
# Merge & rebase
alias grb 'git rebase'
alias gm 'git merge'
alias gcp 'git cherry-pick'
# Stash
alias gst 'git stash'
alias gsta 'git stash push'
alias gstp 'git stash pop'
alias gstl 'git stash list'
alias gstd 'git stash drop'
