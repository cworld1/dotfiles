#!/bin/bash

# Run it if not run
pgrep -x "hyprpaper" >/dev/null || nohup hyprpaper &

# Wallpaper directory
wallpaper_dir=$HOME/Pictures/Wallpapers
wallpaper_files=("$wallpaper_dir"/*)
num_files=${#wallpaper_files[@]}

# Ramdomly select wallpapers
random_index=$((RANDOM % num_files))
selected_wallpaper="${wallpaper_files[random_index]}"
echo $selected_wallpaper

# Set wallpaper for monitors
hyprctl hyprpaper preload "$selected_wallpaper"
hyprctl hyprpaper wallpaper "eDP-2,$selected_wallpaper"
hyprctl hyprpaper wallpaper "HDMI-A-1,$selected_wallpaper"
