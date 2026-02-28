#!/bin/bash

SHORTCUT_NAME="Get Calendar Events"

# Run the Shortcut and capture plain text output
EVENTS=$(shortcuts run "$SHORTCUT_NAME" --output-type public.plain-text 2>/dev/null)

# Debug line (remove later if you want)
echo "DEBUG: Shortcut '$SHORTCUT_NAME' returned: '$EVENTS'" >&2

if [ -z "$EVENTS" ]; then
  EVENTS="No events today"
  COLOR=0x88888888   # grey when empty
else
  # Optional: shorten if the bar gets too crowded
  if [ ${#EVENTS} -gt 60 ]; then
    EVENTS="${EVENTS:0:57}…"
  fi
  COLOR=0xfff38ba8   # red when events exist
fi

# Set label and color in one go
sketchybar --set "$NAME" \
  label="$EVENTS" \
  label.color="$COLOR" \
  icon.color="$COLOR"
