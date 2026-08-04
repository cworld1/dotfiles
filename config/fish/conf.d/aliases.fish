if status is-interactive
  abbr -a ... "cd ../.."
  abbr -a .... "cd ../../.."
  abbr -a ..... "cd ../../../.."

  # System
  abbr -a rmf 'rm -rf' # force delete
  abbr -a tempcd 'mktemp -d | cd' # make temp dir & cd
  abbr -a mkdir 'mkdir -v -p'
  function mkcd -d "Create and enter directory"
    mkdir -p $argv && cd $argv
  end
  alias wget 'wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

  # Shell
  abbr -a cls clear
  alias unset "set --erase"
  alias :q exit
  alias :Q exit

  # Function
  abbr -a pt 'proxy toggle'
  abbr -a p1 'proxy on'
  abbr -a p0 'proxy off'
  abbr -a pi 'proxy info'

  # User
  alias clean~ xdg-ninja
  alias osfetch fastfetch
  alias gitfetch onefetch
  alias logfetch git-cliff
end
