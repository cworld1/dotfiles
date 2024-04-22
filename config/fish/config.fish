### Local func ###

### Envs ###
function setenv
    set -gx $argv
end
source ~/.config/shell/envs.sh

### Alias ###
function setalias
    alias $argv
end
source ~/.config/shell/alias.sh
# Abbrs
abbr -a ... ../..
abbr -a .... ../../..

### Paths ###
function setpath
    if test "$argv[2]" = before
        set -gx PATH (echo $argv[1] | tr ': ' '\n') $PATH
    else
        set -gx PATH $PATH (echo $argv[1] | tr ': ' '\n')
    end
end
source ~/.config/shell/paths.sh

### Custom func ###
source ~/.config/fish/customize.fish

# Proxy
set -x no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"
function pon
    set -Ux http_proxy "http://$hostip:7890"
    set -Ux https_proxy $http_proxy
    echo "Proxy has been opened."
end
function poff
    set -e http_proxy
    set -e https_proxy
    echo "Proxy has been closed."
end
function pshow
    echo "HTTP proxy : $http_proxy"
    echo "HTTPs proxy: $http_proxy"
end
