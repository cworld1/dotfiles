if test "$argv[1]" = "msys"
  abbr -a pacs 'pacman -Ss'
  abbr -a paci 'pacman -Si'
  abbr -a pacI 'pacman -S'
  abbr -a pacu 'pacman -Su'
  abbr -a pacU 'pacman -Syu'
  abbr -a pacr 'pacman -Rsu'
else
  abbr -a pacs 'sudo pacman -Ss'
  abbr -a paci 'sudo pacman -Si'
  abbr -a pacI 'sudo pacman -S'
  abbr -a pacu 'sudo pacman -Su'
  abbr -a pacU 'sudo pacman -Syu'
  abbr -a pacr 'sudo pacman -Rsu'
  # Paru
  abbr -a parus 'sudo paru -Ss'
  abbr -a parui 'sudo paru -Si'
  abbr -a paruI 'sudo paru -S'
  abbr -a paruu 'sudo paru -Su'
  abbr -a parur 'sudo paru -Rsu'
end
