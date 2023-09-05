#!/bin/sh

theme="$HOME/.config/rofi/themes/sysinfo.rasi"
title='      System Information      '
details="
#########################################################
Hostname:	`hostname`
Uptime:		`uptime -p | cut -c 4-`
OS:		`cat /etc/os-release | grep PRETTY | cut -c 14-23` `uname -m` 
Kernel:		` uname -r`
#########################################################
Packages:	`pacman -Q | wc -l` (pacman)
Updates:	`pacman -Qu | wc -l` Available
#########################################################
Make:		`cat /sys/devices/virtual/dmi/id/sys_vendor`
Model:		`cat /sys/devices/virtual/dmi/id/product_name`
Processor:	`lscpu | grep "Model name" | cut -c 37- | awk '{print $1,$2,$3,$4,$5,$6,$7,$8}' `
CPU's:		`lscpu | grep "CPU(s):" | head -1 | cut -c 37-`
RAM:		`free -m | sed '2q;d' | awk '{sum+=$2+$5} {print sum/1000}' | cut -c 1-3` GB
#########################################################
"

rofi_cmd() {
	rofi -theme-str "listview {columns: 1; lines: 1;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-p "$title" \
		-mesg "$details" \
		-markup-rows \
		-theme ${theme}
}

rofi_cmd

