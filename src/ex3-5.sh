#!/bin/bash
run_ls(){
    echo "Inside function: ls $*"
    ls "$@"
}
if [ "$#" -gt 0 ]; then
    run_ls "$@"
    exit $?
fi
while true; do
    echo "1) User  2) CPU  3) Memory  4) Disk  5) Exit"
    read -r -p "Choice: " choice || break
    case "$choice" in
        1) whoami; id ;;
        2) LC_ALL=C top -b -n 1 | head -n 12 ;;
        3) free -h ;;
        4) df -h . ;;
        5) break ;;
        *) echo "Choose 1-5." ;;
    esac
done
