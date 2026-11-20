#!/bin/bash
set -e
read -r -p "Folder name: " dir
[[ $dir =~ ^[a-zA-Z0-9_-]+$ ]] || { echo "Use letters, digits, _ or -."; exit 1; }
mkdir -p -- "$dir"
for i in {1..5}; do
    [ ! -e "$dir/file$i.txt" ] && [ ! -e "$dir/file$i" ] || { echo "Existing data; stopping."; exit 1; }
done
for i in {1..5}; do
    printf 'File %s\n' "$i" > "$dir/file$i.txt"
    mkdir "$dir/file$i"
    ln -s "../file$i.txt" "$dir/file$i/file$i.txt"
    ls -l "$dir/file$i/file$i.txt"
    cmp "$dir/file$i.txt" "$dir/file$i/file$i.txt"
done
echo "Verified: 5 symbolic links point to their original files."
