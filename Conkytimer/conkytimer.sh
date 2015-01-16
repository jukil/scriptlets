#!/usr/bin/env bash

# Add to ~/.conkyrc:
# {$if_running conkytimer}${execpi 30 ~/.conkytimer}$endif
# Start a task: conkytimer "<task description>" <min>

# Clean ~/.conkytimer on SIGINT
trap "rm ~/.conkytimer" INT

task=$1
min=$2

for (( i = 0; i < $min; i++ )); do
	# write remaining min to file
	timer=$((min-i))
	display="${timer}min: $task"
	echo "$display" > ~/.conkytimer
	# wait 1min
	sleep 60
done

rm ~/.conkytimer 
notify-send -t 100000 -i warning "Finished Timer" "$task" --icon=appointment-soon
paplay /usr/share/sounds/freedesktop/stereo/complete.oga
