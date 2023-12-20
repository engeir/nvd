#!/bin/bash

if ! command -v gum >/dev/null 2>&1; then
    echo "gum is a required dependency of this scipt. See https://github.com/charmbracelet/gum."
fi

NVIM=$(find "$HOME"/.config/neovim_distros/ -maxdepth 1 -mindepth 1 -type d | sed 's#.*/##' | gum filter)
NVIM_DIR="$HOME"/.config/neovim_distros/"$NVIM"

if [[ -d "$NVIM_DIR" ]]; then
    # gum style \
    #     --foreground 212 --border-foreground 212 --border double \
    #     --align center --width 50 --margin "1 2" --padding "2 4" \
    #     "Are you sure you want to delete the Neovim distro" "" "$NVIM" "" "($NVIM_DIR)"
    red_bold Are you sure you want to delete the Neovim distro "$NVIM"?
    magenta Located at "$NVIM_DIR"
    gum confirm "Do you want to detele $NVIM?" || exit 0
    rm -rf "$NVIM_DIR"
else
    echo "must be an existing directory"
    exit 1
fi
