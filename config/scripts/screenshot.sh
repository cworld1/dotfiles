#!/bin/bash

# icon="$HOME/.config/mako/icons/picture.png"
# notify_cmd_shot="notify-send -h string:x-canonical-private-synchronous:shot-notify -u low -i $icon"
notify_cmd_shot="notify-send -u low"

notify_view() {
  ${notify_cmd_shot} "Copied to clipboard."
}

shot_area() {
  grim -g "$(slurp -w 0)" - | wl-copy
  notify_view
}

shot_area_edit() {
  file="Screenshot_${time}_${RANDOM}.png"
  cd ~/Pictures/Screenshots/
  grim -g "$(slurp -w 0)" - | tee $file
  rnote $file 
}

shot_cur_window() {
  w_pos=$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ' | tail -n1)
  w_size=$(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | tail -n1 | sed s/,/x/g)
  grim -g "$w_pos $w_size" - | wl-copy
  notify_view
}

if [[ "$1" == "--area" ]]; then
  shot_area
elif [[ "$1" == "--win" ]]; then
  shot_cur_window
elif [[ "$1" == "--edit" ]]; then
  shot_area_edit
else
  echo -e "Available Options: --win --area --edit"
fi

exit 0
