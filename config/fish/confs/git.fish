abbr -a g git
# Clone
abbr -a gcl 'git clone'
abbr -a gclm 'git clone --recurse-submodules'
abbr -a gcls 'git clone --depth 1 --single-branch'
# Status & add & reset
abbr -a gs 'git status'
abbr -a ga 'git add --verbose'
abbr -a gaa 'git add --all'
abbr -a gr 'git reset'
abbr -a grh 'git reset --hard'
abbr -a grs 'git restore --staged'
# Commit
abbr -a gc 'git commit --verbose'
abbr -a gcmsg 'git commit -m'
abbr -a gc! 'git commit --amend --verbose'
# Branch & checkout
abbr -a gb 'git branch --all --verbose'
abbr -a gC 'git checkout'
abbr -a gCm 'git checkout main'
abbr -a gCd 'git checkout dev'
abbr -a gD 'git checkout --'
# Remote
abbr -a gf 'git fetch'
abbr -a gfa 'git fetch --all --prune'
abbr -a gp 'git pull --rebase'
abbr -a gP 'git push'
abbr -a gro 'open $(git remote get-url origin | sed "s/\.git\$//")'
# Inspect
abbr -a gl 'git log --stat'
abbr -a glg "git log --graph --abbrev-commit --decorate \
--format=format:'%C(bold blue)%h%C(reset) -%C(bold yellow)%d%C(reset) \
%C(white)%s%C(reset) %C(bold green)(%ar)%C(reset) \
%C(dim white)- %an%C(reset)' --all"
abbr -a gsh 'git show'
abbr -a gd 'git diff'
# Merge & rebase
abbr -a grb 'git rebase'
abbr -a gm 'git merge'
abbr -a gcp 'git cherry-pick'
# Stash
abbr -a gst 'git stash'
abbr -a gsta 'git stash push'
abbr -a gstp 'git stash pop'
abbr -a gstl 'git stash list'
abbr -a gstd 'git stash drop'
