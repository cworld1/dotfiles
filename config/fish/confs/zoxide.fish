zoxide init fish | source

function zv
    z $argv; and $EDITOR .
end
