# System
setalias :q exit
setalias :Q exit
setalias cls clear
setalias where whereis
setalias rmf 'rm -rf'
setalias mkdir 'mkdir -v -p'
# Pacman
setalias paci 'sudo pacman -S'
setalias pacr 'sudo pacman -R'
setalias pacu 'sudo pacman -Syyu'
setalias wget "wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""

# User
setalias py python
setalias jo joshuto
setalias osfetch neofetch
setalias files nautilus
# setalias rg ripgrep
setalias clean~ xdg-ninja
# Clipboard
setalias clip 'cliphist list | fzf | cliphist decode | wl-copy'
# Git
setalias gitfetch onefetch
setalias gitc 'git clone'
# Lsd
setalias l 'lsd -A'
setalias ll 'lsd -lA'
setalias lt 'lsd -A --tree'
# Neovim
setalias v nvim
setalias nvi nvim
# Paru
setalias parui 'paru -S'
setalias parur 'paru -R'
setalias paruu 'paru -Syyu'
setalias paruc 'paru -c'
# Cmake
setalias cmc 'cmake . -G "Unix Makefiles" -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
setalias cmr 'cmake --build build && build/main'
# Clash
setalias clashr 'systemctl --user restart clash-meta.service'
setalias clashs 'systemctl --user status clash-meta.service'
setalias clashd 'firefox "http://127.0.0.1:9090/ui/#/"'
