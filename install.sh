#!/bin/bash

# get current script path
PROJECT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_PATH="$PROJECT_PATH/config"

# if exsists XDG_CONFIG_HOME then use it, else use ~/.config
if [ -z "$XDG_CONFIG_HOME" ]; then
	CONFIG_HOME="$HOME/.config"
else
	CONFIG_HOME="$XDG_CONFIG_HOME"
fi

# create config home if not exists
if [ ! -d "$CONFIG_HOME" ]; then
	mkdir -p "$CONFIG_HOME"
fi

# go to config home
cd "$CONFIG_HOME"

# mention the users
echo "Link: $SCRIPT_PATH -> $CONFIG_HOME"
read -p "Do you want to continue? [Y/n] " -n 2 -r
if [[ $REPLY =~ ^[Nn]$ ]]; then
	exit 1
fi

# create soft folder links (if exists soft link, overwrite; if exists file, backup)
echo "Creating links for config files..."
for file in $SCRIPT_PATH/*; do
	filename=$(basename "$file")
	# clean the links
	if [ -h "$CONFIG_HOME/$filename" ]; then
		rm "$CONFIG_HOME/$filename"
	fi
	# backup files
	if [ -e "$CONFIG_HOME/$filename" ]; then
		mv "$CONFIG_HOME/$filename" "$CONFIG_HOME/$filename.bak"
		echo "Backup: $CONFIG_HOME/$filename.bak"
	fi
	ln -s "$file" "$CONFIG_HOME/$filename"
done
echo "Done."
