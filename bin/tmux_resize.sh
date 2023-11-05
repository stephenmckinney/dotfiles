#!/bin/bash

# Tmux Pane Splitting Script
# Usage:
#   Use the -p flag followed by a percentage to split the current tmux pane vertically, allocating the specified percentage of the window's height to the main pane.
#   Ensure the percentage value is an integer, else the script will exit with an error message.
#     Example: To Resize to 70% of client height
#       ./script.sh -p 70

pflag=
while getopts l:p:t: name;
do
    case $name in
    p)    pflag=1
          percentage="$OPTARG";;
    ?)   printf "Usage: %s: [-p percentage] \n" $0
          exit 2;;
    esac
done

if [ ! -z "$pflag" ]; then
    if ! [ "$percentage" -eq "$percentage" ] 2> /dev/null; then
        printf "Percentage (-p) must be an integer" >&2
        exit 1
    fi
    MAIN_PANE_SIZE=$(expr $(tmux display -p '#{window_height}') \* $percentage \/ 100)
    tmux split-window -v -l $MAIN_PANE_SIZE
fi

exit 0
