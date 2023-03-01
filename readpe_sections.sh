#!/bin/bash

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
