status is-interactive; or return

zoxide init fish | source


set -gx _ZO_DATA_DIR "$XDG_DATA_HOME"/zoxide  

function zv
  z $argv; and $EDITOR .
end
