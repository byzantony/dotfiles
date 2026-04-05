#!/bin/sh
# Clipboard manager using your type-4 launcher style

cliphist list | rofi -dmenu -i \
    -theme ~/.config/rofi/launchers/type-4/style.rasi \
    -p "  Clipboard" \
    -mesg "Select item to copy" \
    -kb-select-1 "Return" | cliphist decode | wl-copy
