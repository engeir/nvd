#!/bin/bash

if ! command -v gum >/dev/null 2>&1; then
    echo "gum is a required dependency of this scipt. See https://github.com/charmbracelet/gum."
fi

NVIM=$(find "$HOME"/.config/neovim_distros/ -maxdepth 1 -mindepth 1 -type d -printf '%f\n' | gum filter)

if [[ $(find "$HOME/.config/neovim_distros/$NVIM" -maxdepth 1 -name "init.lua") == "" ]]; then
    NVIM=$(dirname "$(find "$HOME/.config/neovim_distros/$NVIM" -name "init.lua" | grep "nvim/init.lua")" | sed -n -e 's/^.*neovim_distros\///p')
fi
NVIM_APPNAME="neovim_distros/$NVIM" nvim "$@"
