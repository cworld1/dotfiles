function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

complete -c yazi -l cwd-file -d 'Write the cwd on exit to this file' -r -F
complete -c yazi -l chooser-file -d 'Write the selected files on open emitted by the chooser mode' -r -F
complete -c yazi -l clear-cache -d 'Clear the cache directory'
complete -c yazi -l debug -d 'Print debug information'
complete -c yazi -s V -l version -d 'Print version'
complete -c yazi -s h -l help -d 'Print help'
