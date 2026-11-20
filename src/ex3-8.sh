#!/bin/bash
if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
    echo "Usage: $0 name birthday_or_phone [--new]"; exit 1
fi
name=$1; info=$2
if [[ -z $name || -z $info || $name == *$'\t'* || $name == *$'\n'* || $info == *$'\t'* || $info == *$'\n'* ]]; then
    echo "Empty values, tabs and newlines are not allowed."; exit 1
fi
case "${3-}" in
    --new) printf '%s\t%s\n' "$name" "$info" > DB.txt ;;
    '') printf '%s\t%s\n' "$name" "$info" >> DB.txt ;;
    *) echo "Unknown option."; exit 1 ;;
esac
echo "Saved: $name / $info"
cat DB.txt
