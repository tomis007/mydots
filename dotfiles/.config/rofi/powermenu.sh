#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='powermenu'

# Options
yes='Y'
no='N'
lock="\Uf033e"
logout="\Uf0343"
suspend="\Uf04b2"
reboot="\Uf0709"
shutdown="\Uf0425"
echo $lock $logout $suspend $reboot $shutdown


# Rofi CMD
rofi_cmd() {
	rofi -dmenu -theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd | xxd | cut -d' ' -f 2,3 | sed -e 's/ //g'
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			hyprctl dispatch exit
		elif [[ $1 == '--lock' ]]; then
			hyprlock
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    "f3b090a5")
		run_cmd --shutdown
        ;;
    "f3b09c89")
		run_cmd --reboot
        ;;
    "f3b08cbe")
		run_cmd --lock
        ;;
    "f3b092b2")
		run_cmd --suspend
        ;;
    "f3b08d83")
		run_cmd --logout
        ;;
esac
