export YAZI_CONFIG_HOME="$XDG_CONFIG_HOME"/yazi

status is-interactive; or return

function y
  set tmp (mktemp -t yazi-cwd.XXXXXX)
  command yazi $argv --cwd-file=$tmp
  if read -z cwd < $tmp
    type -q cygpath; and set cwd (cygpath -u -- $cwd)
    test "$cwd" != "$PWD"; and test -d "$cwd"; and cd -- "$cwd"
  end
  rm -f -- $tmp
end

complete -c yazi -l cwd-file -d 'Write the cwd on exit to this file' -r -F
complete -c yazi -l chooser-file -d 'Write the selected files on open emitted by the chooser mode' -r -F
complete -c yazi -l clear-cache -d 'Clear the cache directory'
complete -c yazi -l debug -d 'Print debug information'
complete -c yazi -s V -l version -d 'Print version'
complete -c yazi -s h -l help -d 'Print help'
