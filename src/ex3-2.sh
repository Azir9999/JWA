#!/bin/bash
read -r -p "Enter at least two x values: " -a values
[ "${#values[@]}" -ge 2 ] || { echo "At least two values required."; exit 1; }
for x in "${values[@]}"; do
    [[ $x =~ ^-?([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]] || { echo "Invalid number: $x"; exit 1; }
done
for x in "${values[@]}"; do
    awk -v x="$x" 'BEGIN {printf "x = %g, y = %.6f\n", x, 0.5*x*x}'
done
