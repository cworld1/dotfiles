set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.bfsu.edu.cn/git/homebrew/brew.git"
set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.bfsu.edu.cn/git/homebrew/homebrew-core.git"
set -gx HOMEBREW_API_DOMAIN "https://mirrors.bfsu.edu.cn/homebrew-bottles/api"
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.bfsu.edu.cn/homebrew-bottles"
set -gx HOMEBREW_PIP_INDEX_URL "https://mirrors.bfsu.edu.cn/pypi/web/simple"
set -gx HOMEBREW_PORTABLE_RUBY_URL "https://mirrors.bfsu.edu.cn/homebrew-bottles/bottles-portable-ruby"  

abbr -a brews 'brew search'
abbr -a brewi 'brew info'
abbr -a brewI 'brew install'
abbr -a brewu 'brew update'
abbr -a brewU 'brew upgrade'
abbr -a brewr 'brew uninstall'
abbr -a brewc 'brew cleanup'
