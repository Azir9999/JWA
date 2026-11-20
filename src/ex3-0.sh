#!/bin/bash
# Run with: source src/ex3-0.sh
if ! grep -qxF 'export MYENV="Hello Shell"' "$HOME/.bashrc"; then
    printf '\nexport MYENV="Hello Shell"\n' >> "$HOME/.bashrc"
fi
export MYENV="Hello Shell"
printf 'Current shell: %s\n' "$MYENV"
bash -c 'printf "Child shell: %s\n" "$MYENV"'
unset MYENV
printf 'After unset: [%s]\n' "${MYENV-}"
bash -c 'printf "Child after unset: [%s]\n" "${MYENV-}"'
# .bashrc still contains the export; a new interactive shell restores it.
