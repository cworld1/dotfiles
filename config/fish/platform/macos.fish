# Files
function trash -d "Move files to trash on macOS"
  for arg in $argv
    set -l file (realpath "$arg")
    /usr/bin/osascript -e "tell application \"Finder\" to delete POSIX file \"$file\"" >/dev/null
  end
end

# Clipboard
alias copy pbcopy
