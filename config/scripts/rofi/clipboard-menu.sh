#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>

# Import Current Theme
RASI="$HOME/.config/rofi/clipmenu.rasi"
prompt='Clipboard'

# Options
# cliphist list | rofi -dmenu -theme $rofiDir/launcher.rasi | cliphist decode | wl-copy

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$prompt" \
		-markup-rows \
		-theme ${RASI}
}

# Pass variables to rofi dmenu
run_rofi() {
	cliphist list | head -n 100 | rofi_cmd
}

# Actions
chosen=$(run_rofi)
# Check if option is selected
if [ "$chosen" != "" ]; then
	echo "$chosen" | cliphist decode | wl-copy
fi
