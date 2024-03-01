# Customize
setalias file open # file explorer
# Proxy
setalias pboard 'open -a Safari "http://127.0.0.1:9090/ui/#/"'
setalias plist 'nvim ~/.config/webserver/gfwlist.pac'
# Package manager
setalias binstall 'brew install'
setalias bsearch 'brew search'
setalias binfo 'brew info'
# Cmake
setalias cmg 'cmake . -G "Unix Makefiles" -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
setalias cmr 'cmake --build build && build/main'
# setalias clean~ xdg-ninja

# System
setalias :q exit
setalias :Q exit
setalias cls clear
setalias where whereis
setalias rmf 'rm -rf'
setalias mkdir 'mkdir -v -p'

# User
setalias py python
setalias jo joshuto
setalias osfetch neofetch
setalias wget "wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
# Git
setalias gitfetch onefetch
setalias gclone 'git clone'
# Lsd
setalias l 'lsd -A'
setalias ll 'lsd -lA'
setalias lt 'lsd -A --tree'
# Neovim
setalias v nvim
setalias nvi nvim
setalias "v." 'nvim .'
setalias "v," 'nvim .'
