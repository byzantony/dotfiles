#!/bin/bash
# Build list with hidden dispatcher/arg for execution
SELECTED=$(hyprctl binds -j | jq -r '.[] | 
    (if .description != "" then .description else .dispatcher + " " + .arg end) + 
    "|" + .dispatcher + "|" + .arg' | \
    awk -F'|' '{print $1}' | \
    rofi -dmenu \
         -p "Keybindings" \
         -theme-str 'window {width: 800px; height: 600px;}' \
         -i)

[ -z "$SELECTED" ] && exit 0

# Get dispatcher and arg for selected description
MATCH=$(hyprctl binds -j | jq -r '.[] | 
    (if .description != "" then .description else .dispatcher + " " + .arg end) + 
    "|" + .dispatcher + "|" + .arg' | grep "^$SELECTED|")

DISPATCHER=$(echo "$MATCH" | cut -d'|' -f2)
ARG=$(echo "$MATCH" | cut -d'|' -f3)

# Execute via hyprctl
hyprctl dispatch "$DISPATCHER" "$ARG"
