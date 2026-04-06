if test "$argv[1]" = "msys"
  alias pacs 'pacman -Ss'
  alias paci 'pacman -Si'
  alias pacI 'pacman -S'
  alias pacu 'pacman -Su'
  alias pacU 'pacman -Syu'
  alias pacr 'pacman -Rsu'
else
  alias pacs 'sudo pacman -Ss'
  alias paci 'sudo pacman -Si'
  alias pacI 'sudo pacman -S'
  alias pacu 'sudo pacman -Su'
  alias pacU 'sudo pacman -Syu'
  alias pacr 'sudo pacman -Rsu'
  # Paru
  alias parus 'sudo paru -Ss'
  alias parui 'sudo paru -Si'
  alias paruI 'sudo paru -S'
  alias paruu 'sudo paru -Su'
  alias parur 'sudo paru -Rsu'
end
