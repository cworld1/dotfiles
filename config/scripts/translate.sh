#!/bin/bash

# $trans=/home/cworld/.local/bin/trans

text=$(cliphist list | head -n 1 | cut -f 2)
# text='你好'
# text='Hello world!'

# Automatically get language
if [[ $(trans "$text" -identify | head -n 1 | cut -f 1 -d ' ') =~ "简体中文" ]]; then
	lan=:en
else
	lan=:zh
fi
echo "Lan: $lan"

# If only one word, enable dictory mode
# if [[ lan=:zh || $text =~ " " ]]; then
# 	mode=-brief
# else
# 	mode=-dictionary
# fi
mode=-brief
# echo "Mode: $mode"

# trans $lan "$text" $mode -view
# kitty --hold --title "Translation" -- fish -c "trans $lan \"$text\" $mode -view"
echo "trans $lan \"$text\" $mode -view"
# wezterm start trans $lan "$text" $mode | wl-copy
