set fish_confs "$XDG_CONFIG_HOME"/fish/confs
source ~/.config/fish/customize.fish

if [ -f "$XDG_CONFIG_HOME"/fish/private.fish ]
    source "$XDG_CONFIG_HOME"/fish/private.fish
end
