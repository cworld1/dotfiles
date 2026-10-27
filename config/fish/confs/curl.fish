status is-interactive; or return

# pb
# See https://fars.ee/
abbr -a pb 'curl -F "c=@-" "http://fars.ee/"'
abbr -a pb24 'curl -F sunset=1440 -F "c=@-" "http://fars.ee/"'
abbr -a pbp24 'curl -F p=1 -F sunset=1440 -F "c=@-" "http://fars.ee/"'
function pbd
  echo "Excuting: curl -X DELETE \"http://fars.ee/$argv[1]\""
  curl -X DELETE "http://fars.ee/$argv[1]"
end

# IP
abbr -a myip 'curl myip.ipip.net'
abbr -a myipv6 'curl -6 myip.ipip.net'
abbr -a myipv4 'curl -4 myip.ipip.net'

# Weather
function weather
  set -q LOCATION[1]; or set LOCATION $argv[1]
  curl "https://v2d.wttr.in/$LOCATION"
end

# Tldr cheat
function cheat
  echo "Excuting: curl https://cht.sh/$argv | delta"
  curl "https://cht.sh/$argv" | delta
end

# QRCode
function qrcode
  echo "Excuting: cutl https://qrenco.de/$argv"
  curl "https://qrenco.de/$argv"
end

# GitHub
function gh_newrepo
  if test (count $argv) -lt 1; or test (count $argv) -gt 2
    echo "Usage: gh_newrepo <repository-name> [-p]"
    return 1
  end
  set -l repo $argv[1]
  set -l private (test "$argv[2]" = "-p"; and echo true; or echo false)
  read -sP "GitHub token: " token
  echo "Requesting..."
  curl -sS \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $token" \
    -H "X-GitHub-Api-Version: 2026-03-10" \
    -d "{\"name\":\"$repo\",\"private\":$private}" \
    https://api.github.com/user/repos
end
