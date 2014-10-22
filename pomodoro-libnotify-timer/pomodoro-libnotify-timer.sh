#!/usr/bin/env bash

case $1 in
	break )
		notify-send -i warning "Pomodoro Timer" "Timer set to 5min break" --icon=appointment-soon
		sleep 300 
		paplay /usr/share/sounds/freedesktop/stereo/complete.oga 
		notify-send -i warning "Pomodoro Timer" "Time to get back to work" --icon=appointment-soon
		;;
	work )
		notify-send -i warning "Pomodoro Timer" "Timer set to 25min work" --icon=appointment-soon
		sleep 1500 
		paplay /usr/share/sounds/freedesktop/stereo/complete.oga 
		notify-send -i warning "Pomodoro Timer" "Time to take a break" --icon=appointment-soon
		;;
esac	