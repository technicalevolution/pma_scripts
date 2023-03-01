#!/bin/bash

####
## extract the interesting section sizes for easy comparison
## from the output of readpe and display in a table

## readpe -S <pe file> | ./readpe_sections.sh

cat - | awk 'BEGIN {
	print "section,virtual size,raw size"
}

/ Section/ {
	getline
	section_name=$2
}

/ Virtual Size:/ {
	virtual_size=$4
	gsub(/\(/, "", virtual_size)
}

/ Size Of Raw Data:/ {
	raw_data=$6
	gsub(/\(/, "", raw_data)
	print section_name","virtual_size","raw_data
}' | column -t -s,
