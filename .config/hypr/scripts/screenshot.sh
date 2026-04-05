#!/bin/bash

SCREENSHOT_DIR="/home/anthony/Pictures/Screenshots"
FILENAME="$(date +%Y-%m-%d_%H-%M-%S).png"
FILEPATH="$SCREENSHOT_DIR/$FILENAME"

mkdir -p "$SCREENSHOT_DIR"

# Take screenshot based on argument
case "$1" in
    area)
        grimblast save area "$FILEPATH"
        ;;
    screen)
        grimblast save screen "$FILEPATH"
        ;;
    active)
        grimblast save active "$FILEPATH"
        ;;
esac

# Check if screenshot was actually taken (user may have cancelled)
if [ -f "$FILEPATH" ]; then
    # Copy to clipboard too
    wl-copy < "$FILEPATH"
    
    # Send notification with action to open file
    ACTION=$(notify-send "Screenshot Saved" "$FILENAME" \
        --icon "$FILEPATH" \
        --action "open=Open" \
        --action "folder=Show in Folder" \
        --wait)

    case "$ACTION" in
        open)
            swappy -f "$FILEPATH"
            ;;
        folder)
            thunar "$SCREENSHOT_DIR"
            ;;
    esac
fi
