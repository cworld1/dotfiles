# Files
function trash -d "Move files to trash on macOS"
  for arg in $argv
    set -l file (realpath "$arg")
    /usr/bin/osascript -e "tell application \"Finder\" to delete POSIX file \"$file\"" >/dev/null
  end
end

# Clipboard
alias copy pbcopy

# Notification (notify <title> <content>)
function notify --description "Send notification to desktop"
  # say $argv[1]
  osascript -e "display notification \"$argv[2..-1]\" with title \"$argv[1]\" sound name \"default\""
end
