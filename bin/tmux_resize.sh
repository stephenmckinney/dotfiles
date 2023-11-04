#!/bin/bash
# tmux resize script by percentage
#
# Options:
# -p percentage (required): an integer of the percentage of the client width/height to set
#                              window name, index, or id
#
# Example usage:
#
# Resize to 66% of client height
# $ .tmux_resize.sh -p 66

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
