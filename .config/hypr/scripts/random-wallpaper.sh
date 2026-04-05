#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/4k-Wallpapers"
MONITORS=("HDMI-A-1" "DVI-D-1")

for monitor in "${MONITORS[@]}"; do
    wall=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
    hyprctl hyprpaper wallpaper "$monitor,$wall"
done
