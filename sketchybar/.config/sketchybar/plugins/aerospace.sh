#!/usr/bin/env bash
# ============================================================
# plugins/aerospace.sh $WORKSPACE_ID
#
# Fires on every aerospace_workspace_change event.
# Does two things:
#   1. Highlights the active workspace button, dims the rest
#   2. Shows app icons inside each workspace button
#
# Debug log written to /tmp/aerospace_sketchybar.log
# Run: tail -f /tmp/aerospace_sketchybar.log  to watch it live
# ============================================================

AEROSPACE=/opt/homebrew/bin/aerospace
LOG=/tmp/aerospace_sketchybar.log

source "$CONFIG_DIR/plugins/icon_map.sh"
source "$CONFIG_DIR/colors.sh"

echo "--- $(date) workspace=$1 focused=$FOCUSED_WORKSPACE name=$NAME ---" >> "$LOG"

# ── 1. Highlight active / dim inactive ──────────────────────

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" \
        background.drawing=on \
        background.color=$SPACE_ACTIVE_BG_COLOR \
        icon.color=$SPACE_ACTIVE_COLOR \
        label.color=$SPACE_ACTIVE_COLOR
else
    sketchybar --set "$NAME" \
        background.drawing=off \
        icon.color=$SPACE_INACTIVE_COLOR \
        label.color=$SPACE_INACTIVE_COLOR
fi

# ── 2. Build app icon string ─────────────────────────────────
#
# --format '%{app-name}' asks AeroSpace to return only the app
# name column — no parsing needed, no separator assumptions.
# Much more reliable than awk on raw output.

apps=$($AEROSPACE list-windows --workspace "$1" --format '%{app-name}' 2>/dev/null | sort -u)

echo "  apps for $1: $(echo "$apps" | tr '\n' '|')" >> "$LOG"

icon_string=""
while IFS= read -r app; do
    [ -z "$app" ] && continue
    __icon_map "$app"
    echo "  __icon_map '$app' -> '$icon_result'" >> "$LOG"
    if [ "$icon_result" != ":default:" ]; then
        icon_string+="$icon_result"
    fi
done <<< "$apps"

echo "  icon_string: '$icon_string'" >> "$LOG"

if [ -n "$icon_string" ]; then
    sketchybar --set "$NAME" label="$icon_string" label.drawing=on
else
    sketchybar --set "$NAME" label.drawing=off
fi
