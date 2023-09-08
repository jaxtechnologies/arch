#! /bin/sh

# Current Theme
theme="$HOME/.config/rofi/themes/powermenu.rasi"

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme ${theme}
}

chosen=$(printf " Lock\n Logout\n Poweroff\n Reboot" | rofi_cmd )

case "$chosen" in
	" Lock") slock ;;
	" Logout") qtile cmd-obj -o cmd -f shutdown ;;
	" Poweroff") poweroff ;;
	" Reboot") reboot ;;
	*) exit 1 ;;
esac
