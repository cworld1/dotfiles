#!/bin/bash

check_network_status() {
	nmcli networking connectivity | grep -q "full"
}

enable_network_connection() {
	nmcli networking on
}

disable_network_connection() {
	nmcli networking off
}

toggle_network_connection() {
	if check_network_status; then
		disable_network_connection
	else
		enable_network_connection
	fi
}

# 解析命令行参数
if [ $# -eq 1 ]; then
	if [ "$1" = "--on" ]; then
		enable_network_connection
		echo "网络连接已打开"
	elif [ "$1" = "--off" ]; then
		disable_network_connection
		echo "网络连接已关闭"
	elif [ "$1" = "--toggle" ]; then
		toggle_network_connection
		echo "网络连接已切换"
	else
		echo "无效的参数"
	fi
else
	echo "请提供参数 --on、--off 或 --toggle"
fi
