# Files
alias trash 'gio trash'

# Clipboard
alias copy xclip

# Notification: notify <title> <content>
function notify --description "Send notification to desktop"
    notify-send "$argv[1]" "$argv[2..-1]"
end
