export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history

status is-interactive; or return

# Alias for python server
function pyserve
  set -l p (test (count $argv) -eq 1 && echo $argv[1] || echo 8000)
  echo "Serving at http://localhost:$p"
  command -q python3 && python3 -m http.server $p || python -m http.server $p
end
