# Suport VSCode's integrated terminal
# only make sense when used inside VSCode
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)
