# Proxy
function pon
    set -Ux HTTP_PROXY "http://$hostip:7890"
    set -Ux HTTPS_PROXY $HTTP_PROXY
    echo "Proxy has been opened."
end
function poff
    set -e HTTP_PROXY
    set -e HTTPS_PROXY
    echo "Proxy has been closed."
end
function pshow
    echo "HTTP proxy : $HTTP_PROXY"
    echo "HTTPs proxy: $HTTP_PROXY"
end
