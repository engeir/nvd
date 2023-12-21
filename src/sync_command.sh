#!/bin/bash

if ! command -v gum >/dev/null 2>&1; then
    echo "gum is a required dependency of this scipt. See https://github.com/charmbracelet/gum."
fi

NVIM=$(find "$HOME"/.config/neovim_distros/ -maxdepth 1 -mindepth 1 -type d | sed 's#.*/##')

while IFS= read -r f; do
    cd "$HOME/.config/neovim_distros/$f" || continue
    gum spin --spinner dot --title "Pulling from \"$f\"... ($(git config --get remote.origin.url))" -- git pull
    green "Successfully pulled from \"$f\"! ($(git config --get remote.origin.url))"
    cd - >/dev/null || exit 1
done <<<"$NVIM"
