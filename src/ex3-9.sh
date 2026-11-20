#!/bin/bash
[ "$#" -eq 1 ] || { echo "Usage: $0 name"; exit 1; }
[ -f DB.txt ] || { echo "DB.txt not found. Run ex3-8.sh first."; exit 1; }
NAME_QUERY=$1 awk -F '\t' '
$1 == ENVIRON["NAME_QUERY"] {print "Name: " $1 ", Info: " $2; found=1}
END {if(!found) {print "No matching name."; exit 1}}
' DB.txt
