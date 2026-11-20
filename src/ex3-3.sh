#!/bin/bash
read -r -p "Enter at least two scores (0-100): " -a scores
[ "${#scores[@]}" -ge 2 ] || { echo "At least two scores required."; exit 1; }
sum=0; i=1
for score in "${scores[@]}"; do
    [[ $score =~ ^[0-9]{1,3}$ ]] || { echo "Invalid score."; exit 1; }
    score=$((10#$score))
    [ "$score" -le 100 ] || { echo "Score must be 0-100."; exit 1; }
    grade=B
    [ "$score" -ge 90 ] && grade=A
    echo "Subject $i: $score -> $grade"
    sum=$((sum+score)); i=$((i+1))
done
awk -v s="$sum" -v n="${#scores[@]}" 'BEGIN {printf "Average: %.2f, Grade: %s\n",s/n,(s/n>=90?"A":"B")}'
