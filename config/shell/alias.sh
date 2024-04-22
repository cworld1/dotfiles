# Customize
# setalias open explorer # file explorer
# Proxy (for macOS)
setalias pboard 'open -a Safari "http://127.0.0.1:9090/ui/#/"'
setalias pedit 'nvim ~/.config/webserver/gfwlist.pac'

# Package manager
# Brew
setalias brews 'brew search'
setalias brewi 'brew info'
setalias brewI 'brew install'
setalias brewu 'brew update'
setalias brewU 'brew upgrade'
setalias brewr 'brew uninstall'
# Pacman
# setalias pacs 'sudo pacman -Ss'
# setalias paci 'sudo pacman -Si'
# setalias pacI 'sudo pacman -S'
# setalias pacu 'sudo pacman -Su'
# setalias pacU 'sudo pacman -Syu'
# setalias pacr 'sudo pacman -R'

# User
setalias wget 'wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
setalias clean~ xdg-ninja
setalias osfetch fastfetch
setalias gitfetch onefetch
# Cmake
setalias cmg 'cmake . -G "Unix Makefiles" -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
setalias cmr 'cmake --build build && build/main'
# Lsd
setalias l 'lsd -A --group-directories-first'
setalias ll 'lsd -lA --group-directories-first'
setalias lt 'lsd --tree --group-directories-first'
# Neovim
setalias v nvim
setalias nvi nvim
setalias "v." 'nvim .'
setalias "v," 'nvim .'

# Git
setalias g git
# Git add & reset & status
setalias ga 'git add --verbose'
setalias gaa 'git add --all'    # add all
setalias gapa 'git add --patch' # add with interaction
setalias grh 'git reset'
setalias grhh 'git reset --hard'
setalias gs 'git status'
setalias gss 'git status --short'
# Git branch & checkout
setalias gb 'git branch --all --verbose' # list branches
setalias gcb 'git checkout -b'           # new branch & checkout
setalias gcm 'git checkout main'
setalias gcd 'git checkout dev'
setalias gcr 'git checkout release'
# Git commit
setalias gcmsg 'git commit -m'
setalias gc 'git commit --verbose'          # use editor
setalias gc! 'git commit --amend --verbose' # modify last commit
# Git clone
setalias gcl 'git clone'
setalias gcls 'git clone --recurse-submodules' # with submodules
# Git fetch
setalias gf 'git fetch'
setalias gfa 'git fetch --all --prune' # fetch all & clean
# Git pull & push
setalias gp 'git pull'
setalias gP 'git push'
# Git log & show & diff
setalias gl 'git log'
setalias glg 'git log --stat'          # include file status
setalias glgp 'git log --stat --patch' # include diff
setalias glgg 'git log --graph'
setalias glgga 'git log --graph --decorate --all' # include other branch
setalias gsh 'git show'
setalias gd 'git diff'
# Git rebase & merge & cherry-pick
setalias grb 'git rebase'
setalias gm 'git merge'
setalias gcp 'git cherry-pick'
# Git stash
setalias gsta 'git stash push'
setalias gstp 'git stash pop'
setalias gstl 'git stash list'
setalias gsts 'git stash show --text' # show diff
setalias gstd 'git stash drop'
setalias gstc 'git stash clear' # clean all

# System
setalias :q exit
setalias :Q exit
setalias cls clear
setalias where whereis
setalias rmf 'rm -rf'
setalias mkdir 'mkdir -v -p'
