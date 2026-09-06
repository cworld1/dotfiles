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
abbr -a ip 'curl "https://myip.ipip.net/"'
abbr -a ipv6 'curl -6 "https://myip.ipip.net/"'
abbr -a ipv4 'curl -4 "https://myip.ipip.net/"'

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
