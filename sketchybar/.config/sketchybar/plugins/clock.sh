#!/bin/bash

# 12-hour format without leading zero on hour (e.g. 3:14 PM, 11:05 AM)
sketchybar --set "$NAME" label="$(date '+%-I:%M %p')"

# Alternative: always show two digits for hour (e.g. 03:14 PM)
# sketchybar --set "$NAME" label="$(date '+%I:%M %p')"

# With seconds if you want:
# sketchybar --set "$NAME" label="$(date '+%-I:%M:%S %p')"
