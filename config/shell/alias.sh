# System
setalias :q exit
setalias cls clear
setalias where whereis
setalias rmf 'rm -rf'
setalias mkdir 'mkdir -v -p'
setalias paci 'sudo pacman -S'
setalias pacr 'sudo pacman -R'
setalias pacu 'sudo pacman -U'
setalias wget "wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
# User
setalias l 'lsd -A'
setalias ll 'lsd -lA'
setalias lt 'lsd -A --tree'
setalias py python
setalias v nvim
setalias nvi nvim
setalias jo joshuto
setalias gitfetch onefetch
setalias osfetch neofetch
setalias rg ripgrep
setalias clean~ xdg-ninja
setalias gitc 'git clone'
setalias parui 'paru -S'
setalias parur 'paru -R'
setalias paruc 'paru -Yc'
setalias cmc 'cmake . -G "Unix Makefiles" -B build -DCMAKE_EXPORT_COMPILE_COMMANDS 1'
setalias cmr 'cmake --build build && build/main'
setalias clashr 'systemctl --user restart clash-meta.service'
setalias clashs 'systemctl --user status clash-meta.service'
setalias clashd 'firefox "http://127.0.0.1:9090/ui/#/"'
