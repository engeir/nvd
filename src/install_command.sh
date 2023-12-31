#!/bin/bash

if ! command -v gum >/dev/null 2>&1; then
    echo "gum is a required dependency of this scipt. See https://github.com/charmbracelet/gum."
fi

mkdir -p "$HOME/.config/neovim_distros/"
gum style \
    --foreground 212 --border-foreground 212 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    "Welcome to the Neovim distribution installer!" "" "Distributions are placed in ~/.config/neovim_distros/"
URL=$(gum input --placeholder "Enter a URL to clone!")
git ls-remote -h "$URL" &>/dev/null || exit 1
NAME=$(gum input --placeholder "What should we call the nvim distribution?")
gum style \
    --foreground 212 --border-foreground 212 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    "Do you want to run the command"
echo "\$ git clone $URL $HOME/.config/neovim_distros/$NAME" | gum format -t code
gum confirm || exit 0
gum spin --spinner dot --title "Cloning repo from $URL into ~/.config/neovim_distros/$NAME" -- git clone "$URL" "$HOME/.config/neovim_distros/$NAME"
gum style \
    --foreground 212 --border-foreground 212 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    "To use the installed distribution, run" "" "nvd run"
