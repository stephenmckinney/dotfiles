#!/bin/bash

while read -r line
do
    # Split the line into words
    url=$(echo $line | awk '{print $1}')
    filename=$(echo $line | awk '{print $2}')

    # Get default filename if not specified
    if [[ -z "$filename" ]]; then
        filename=$(basename $url)
    fi

    # Download and overwrite file
    wget -O $filename $url
done < themes.txt
