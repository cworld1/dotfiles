#!/bin/bash

# display help
function usage() {
	echo "Usage: $0 [-f | --force] [directory]"
	echo "  -f | --force      If target file exists, delete it and do not backup."
	echo "  directory         Only link the specified directory."
	exit 1
}

# link directory
function link_directory() {
	local DIR="$1"
	local FORCE="$2"
	local FILE="$SCRIPT_PATH/$DIR"
	local FILENAME=$(basename "$FILE")

	if [ -h "$CONFIG_HOME/$FILENAME" ]; then
		rm "$CONFIG_HOME/$FILENAME"
	fi

	if [ -e "$CONFIG_HOME/$FILENAME" ]; then
		if $FORCE; then
			rm -rf "$CONFIG_HOME/$FILENAME"
			echo "Deleted: $CONFIG_HOME/$FILENAME"
		else
			mv "$CONFIG_HOME/$FILENAME" "$CONFIG_HOME/$FILENAME.bak"
			echo "Backup: $CONFIG_HOME/$FILENAME.bak"
		fi
	fi

	ln -s "$FILE" "$CONFIG_HOME/$FILENAME"
}

# get current script path
PROJECT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_PATH="$PROJECT_PATH/config"

# if exists XDG_CONFIG_HOME then use it, else use ~/.config
CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

# create config home if not exists
mkdir -p "$CONFIG_HOME"

# flags
FORCE=false
SINGLE_DIR=""

# parse flags
while [[ $# -gt 0 ]]; do
	case "$1" in
	-f | --force)
		FORCE=true
		shift
		;;
	-h | --help)
		usage
		;;
	*)
		if [ -d "$SCRIPT_PATH/$1" ]; then
			SINGLE_DIR="$1"
		else
			echo "Error: Directory does not exist: $1"
			exit 1
		fi
		shift
		;;
	esac
done

# if not specifying a dir, ask for each
if [ -z "$SINGLE_DIR" ]; then
	for D in "$SCRIPT_PATH"/*; do
		if [ -d "$D" ]; then
			echo "Link: $D -> $CONFIG_HOME/$(basename "$D")"
			read -p "Do you want to continue? [Y/n] " -n 2 -r
			if [[ $REPLY =~ ^[Nn]$ ]]; then
				continue
			fi
			link_directory "$(basename "$D")" "$FORCE"
		fi
	done
else
	link_directory "$SINGLE_DIR" "$FORCE"
fi

echo "Done."
