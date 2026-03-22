## Files
alias open explorer
function trash --description "Move files or folders to Windows Recycle Bin"
  for item in $argv
    set winpath (to_win_path (realpath $item))
    set cmd (test -d "$item"; and echo DeleteDirectory; or echo DeleteFile)
    powershell -NoProfile -Command "Add-Type -AssemblyName Microsoft.VisualBasic;[Microsoft.VisualBasic.FileIO.FileSystem]::$cmd(\"$winpath\", 'OnlyErrorDialogs', 'SendToRecycleBin')"
  end
end

# Clipboard
alias copy clip
alias paste 'powershell get-clipboard'
function to_win_path --argument path
  if string match -r -q '^/[a-z]/' $path
    set drive (string sub -s 2 -l 1 $path | string upper)
    set rest (string sub -s 4 $path)
    set p "$drive:/$rest"
  end
  echo $p
end

## System actions
alias poweroff 'shutdown /s /t 0'
alias reboot 'shutdown /r /t 0'
alias lock 'rundll32 user32.dll,LockWorkStation'
