set -gx ANDROID_USER_HOME "$XDG_DATA_HOME"/android
# alias adb "HOME=$XDG_DATA_HOME/android adb"
function adb
    HOME="$XDG_DATA_HOME/android" command adb $argv
end
