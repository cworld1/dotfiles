#!/usr/bin/env bash

bluetooth_status=$(bluetoothctl show | awk '/Powered/ {print $2}')

if [[ "$bluetooth_status" == "yes" ]]; then
	bluetoothctl power off
else
	bluetoothctl power on
fi
