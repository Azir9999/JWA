#!/bin/bash
scores=()
while true; do
    echo "1) Add score  2) Show scores  3) Average  4) Grade  5) Exit"
    read -r -p "Choice: " choice || break
    case "$choice" in
        1)
            read -r -p "Score (0-100): " score || break
            if [[ $score =~ ^[0-9]{1,3}$ ]] && [ "$((10#$score))" -le 100 ]; then
                scores+=("$((10#$score))"); echo "Added."
            else
                echo "Invalid score."
            fi ;;
        2) echo "Scores: ${scores[*]:-none}" ;;
        3|4)
            if [ "${#scores[@]}" -eq 0 ]; then
                echo "No scores yet."; continue
            fi
            sum=0
            for score in "${scores[@]}"; do sum=$((sum+score)); done
            awk -v s="$sum" -v n="${#scores[@]}" -v c="$choice" 'BEGIN {
                if(c==3) printf "Average: %.2f\n",s/n;
                else printf "Average grade: %s (%.2f)\n",(s/n>=90?"A":"B"),s/n
            }' ;;
        5) echo "Goodbye."; break ;;
        *) echo "Choose 1-5." ;;
    esac
done
