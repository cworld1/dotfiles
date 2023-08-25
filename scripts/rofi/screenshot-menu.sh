#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>

# Import Current Theme
RASI="$HOME/.config/rofi/screenshot.rasi"

# Theme Elements
prompt='Screenshot'
mesg="Directory: ~/Pictures/Screenshots"

# Options
layout=$(cat ${RASI} | grep 'USE_ICON' | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
	option_1="󰆞 Shot Area"
	option_2="󰆟 Shot Window"
	option_3="󰸉 Shot Desktop"
	option_4="󱇤 Shot and edit"
	option_5="󱇸 Shot in 5s"
else
	option_1="󰆞"
	option_2="󰆟"
	option_3="󰸉"
	option_4="󱇤"
	option_5="󱇸"
fi

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${RASI}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Screenshot
time=$(date +%Y-%m-%d-%H-%M-%S)
geometry=$(xrandr | grep 'current' | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current')
dir="$HOME/Pictures/Screenshots"
file="Screenshot_${time}_${geometry}.png"

# Directory
if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# notify and view screenshot
notify_view() {
	notify_cmd_shot="notify-send -u low"
	${notify_cmd_shot} "Copied to clipboard."
}

# countdown
countdown() {
	for sec in $(seq $1 -1 1); do
		dunstify -t 1000 -h string:x-dunst-stack-tag:screenshottimer -i /usr/share/archcraft/icons/dunst/timer.png "Taking shot in : $sec"
		sleep 1
	done
}

# take shots
shotarea() {
	sleep 0.5 && grim -g "$(slurp -w 0)" - | wl-copy
	notify_view
}

shotwin() {
	w_pos=$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ' | tail -n1)
	w_size=$(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | tail -n1 | sed s/,/x/g)
	sleep 0.5 && grim -g "$w_pos $w_size" - | wl-copy
	notify_view
}

shotfull() {
	sleep 0.5 && grim - | wl-copy
	notify_view
}

shot_area_edit() {
	cd $dir && sleep 0.5 && grim -g "$(slurp -w 0)" - | tee $file
	rnote $file
}

shot5() {
	countdown '5'
	cd $dir && grim - | tee $file
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		shotarea
	elif [[ "$1" == '--opt2' ]]; then
		shotwin
	elif [[ "$1" == '--opt3' ]]; then
		shotfull
	elif [[ "$1" == '--opt4' ]]; then
		shot_area_edit
	elif [[ "$1" == '--opt5' ]]; then
		shot5
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
	run_cmd --opt1
	;;
$option_2)
	run_cmd --opt2
	;;
$option_3)
	run_cmd --opt3
	;;
$option_4)
	run_cmd --opt4
	;;
$option_5)
	run_cmd --opt5
	;;
esac
