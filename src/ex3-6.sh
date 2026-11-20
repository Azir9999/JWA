#!/bin/bash
set -e
read -r -p "Folder name: " dir
[[ $dir =~ ^[a-zA-Z0-9_-]+$ ]] || { echo "Use letters, digits, _ or -."; exit 1; }
if [ -d "$dir" ]; then
    echo "Folder exists: $dir"
else
    mkdir -- "$dir"; echo "Created: $dir"
fi
for i in {1..5}; do
    [ ! -e "$dir/file$i.txt" ] || { echo "Existing file; stopping."; exit 1; }
done
for i in {1..5}; do printf 'File %s\n' "$i" > "$dir/file$i.txt"; done
archive=$(mktemp "./${dir}.XXXXXX.tar.gz")
tar -czf "$archive" -C "$dir" file{1..5}.txt
out=$(mktemp -d "./${dir}_extracted.XXXXXX")
tar -xzvf "$archive" -C "$out"
echo "Archive: $archive"
echo "Extracted: $out"
for i in {1..5}; do cmp "$dir/file$i.txt" "$out/file$i.txt"; done
echo "Verified: all 5 files match."
