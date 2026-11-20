#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 integer integer"; exit 1
fi
for n in "$@"; do
    [[ "$n" =~ ^-?[0-9]{1,8}$ ]] || { echo "Enter integers (up to 8 digits)."; exit 1; }
done
a=$((10#${1#-})); b=$((10#${2#-}))
[[ $1 == -* ]] && a=$((-a))
[[ $2 == -* ]] && b=$((-b))
echo "$a + $b = $((a+b))"
echo "$a - $b = $((a-b))"
echo "$a * $b = $((a*b))"
if [ "$b" -eq 0 ]; then
    echo "Division: cannot divide by zero."
else
    echo "$a / $b = $((a/b))"
fi
