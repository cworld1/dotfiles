# Customize
setalias file open # file explorer
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
setalias wget "wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
setalias clean~ xdg-ninja
setalias osfetch fastfetch
setalias gitfetch onefetch
# Cmake
setalias cmg 'cmake . -G "Unix Makefiles" -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
setalias cmr 'cmake --build build && build/main'
# Git
setalias gitc 'git clone'
setalias gitp 'git pull'
setalias gitP 'git push'
# Lsd
setalias l 'lsd -A --group-directories-first'
setalias ll 'lsd -lA --group-directories-first'
setalias lt 'lsd --tree --group-directories-first'
# Neovim
setalias v nvim
setalias nvi nvim
setalias "v." 'nvim .'
setalias "v," 'nvim .'

# System
setalias :q exit
setalias :Q exit
setalias cls clear
setalias where whereis
setalias rmf 'rm -rf'
setalias mkdir 'mkdir -v -p'
