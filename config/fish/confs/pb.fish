# See https://fars.ee/
abbr -a pb 'curl -F "c=@-" "http://fars.ee/"'
abbr -a pb24 'curl -F sunset=1440 -F "c=@-" "http://fars.ee/"'
abbr -a pbp24 'curl -F p=1 -F sunset=1440 -F "c=@-" "http://fars.ee/"'
function pbd
  echo "Excuting: curl -X DELETE \"http://fars.ee/$argv[1]\""
  curl -X DELETE "http://fars.ee/$argv[1]"
end
