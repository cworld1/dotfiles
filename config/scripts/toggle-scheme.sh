#!/bin/bash

current_mode=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ $current_mode == "'prefer-light'" ]]; then
	# gsettings set org.gnome.desktop.interface gtk-theme 'Simple-Dark'
	gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-Dark-Compact'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
else
	# gsettings set org.gnome.desktop.interface gtk-theme 'Simple-Light'
	gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-Light-Compact'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
fi
