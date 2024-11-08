set -gx PNPM_HOME "$XDG_DATA_HOME"/pnpm

contains "$XDG_DATA_HOME"/pnpm $PATH
or set PATH "$XDG_DATA_HOME"/pnpm $PATH

alias pn pnpm
