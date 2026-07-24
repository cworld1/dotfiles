# Proxy
function proxy --description "Enable, disable, toggle or info HTTP/HTTPS proxy"
  # Set address
  set -l addr $argv[2]
  if test -z "$addr"
    set addr $proxy
  end

  # Internal functions
  function __set_proxy -a address
    set -Ux HTTP_PROXY $address
    set -Ux HTTPS_PROXY $address
    echo "Proxy enabled: $address"
  end
  function __unset_proxy
    set -e HTTP_PROXY
    set -e HTTPS_PROXY
    echo "Proxy disabled"
  end

  switch $argv[1]
    case on; __set_proxy $addr
    case off; __unset_proxy
    case toggle
      if set -q HTTP_PROXY; __unset_proxy
      else; __set_proxy $addr
      end
    case info
      if set -q HTTP_PROXY; echo "Current proxy: $HTTP_PROXY"
      else; echo "Proxy is not set."
      end
    case '*'
      echo "Usage: proxy <on|off|toggle|info> [proxy_address]"
      return 1
  end
end
abbr -a pt 'proxy toggle'
abbr -a p1 'proxy on'
abbr -a p0 'proxy off'
abbr -a pi 'proxy info'
