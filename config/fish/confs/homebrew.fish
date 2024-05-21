set -gx HOMEBREW_API_DOMAIN "https://mirrors.bfsu.edu.cn/homebrew-bottles/api"
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.bfsu.edu.cn/homebrew-bottles"
set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.bfsu.edu.cn/git/homebrew/brew.git"
set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.bfsu.edu.cn/git/homebrew/homebrew-core.git"
set -gx HOMEBREW_PIP_INDEX_URL "https://mirrors.bfsu.edu.cn/pypi/web/simple"

alias brews 'brew search'
alias brewi 'brew info'
alias brewI 'brew install'
alias brewu 'brew update'
alias brewU 'brew upgrade'
alias brewr 'brew uninstall'
alias brewc 'brew clean'
