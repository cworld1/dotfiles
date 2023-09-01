#!/bin/bash

# Run it if not run
pgrep -x "hyprpaper" >/dev/null || nohup hyprpaper &

# Wallpaper directory
wallpaper_dir=$HOME/Pictures/Wallpapers

# Function to recursively find wallpaper files
find_wallpapers() {
	local dir=$1
	local files=()
	local file

	# Find wallpaper files in current directory
	for file in "$dir"/*; do
		if [[ -f "$file" ]]; then
			files+=("$file")
		fi
	done

	# Recursively search subdirectories
	for file in "$dir"/*; do
		if [[ -d "$file" ]]; then
			files+=($(find_wallpapers "$file"))
		fi
	done

	echo "${files[@]}"
}

# Get all wallpaper files
wallpaper_files=($(find_wallpapers "$wallpaper_dir"))
num_files=${#wallpaper_files[@]}

# Randomly select a wallpaper
random_index=$((RANDOM % num_files))
selected_wallpaper="${wallpaper_files[random_index]}"
echo "$selected_wallpaper"

# Set wallpaper for monitors
hyprctl hyprpaper preload "$selected_wallpaper"
hyprctl hyprpaper wallpaper "eDP-2,$selected_wallpaper"
hyprctl hyprpaper wallpaper "HDMI-A-1,$selected_wallpaper"
