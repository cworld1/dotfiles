#!/bin/bash

get_bluetooth_status() {
	bluetooth_status=$(bluetoothctl show | awk '/Powered/ {print $2}')
}

enable_bluetooth() {
	bluetoothctl power on
}

disable_bluetooth() {
	bluetoothctl power off
}

toggle_bluetooth() {
	bluetooth_status=$(get_bluetooth_status)
	if [[ "$bluetooth_status" == "yes" ]]; then
		disable_bluetooth
	else
		enable_bluetooth
	fi
}

if [ $# -eq 1 ]; then
	if [ "$1" = "--on" ]; then
		enable_bluetooth
		echo "蓝牙已启用"
	elif [ "$1" = "--off" ]; then
		disable_bluetooth
		echo "蓝牙已禁用"
	elif [ "$1" = "--toggle" ]; then
		toggle_bluetooth
		echo "蓝牙状态已切换"
	else
		echo "无效的参数"
	fi
else
	echo "请提供参数 --on、--off 或 --toggle"
fi
