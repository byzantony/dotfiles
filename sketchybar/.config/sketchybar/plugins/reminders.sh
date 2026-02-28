#!/bin/bash

NAME=reminders ~/.config/sketchybar/plugins/reminders.sh
echo $?   # should be 0
sketchybar --query reminders   # look at "label": { "value": "Your Reminder Title @ 3:00 PM" } or similar

UPCOMING=$(osascript -e '
  set now to current date
  set tomorrow to now + (1 * days)
  set time of tomorrow to 0

  tell application "Reminders"
    set candidates to every reminder whose completed is false and due date is not missing value and due date < tomorrow
    if (count of candidates) > 0 then
      set sorted to sort candidates by due date
      set nextRem to item 1 of sorted
      set remName to name of nextRem
      if due date of nextRem is not missing value then
        set dueStr to short time string of (due date of nextRem)
        return remName & " @" & dueStr
      else
        return remName
      end if
    else
      set allIncomplete to count of (every reminder whose completed is false)
      if allIncomplete > 0 then
        return (allIncomplete as text) & " tasks"
      else
        return ""
      end if
    end if
  end tell
')

if [ -z "$UPCOMING" ]; then
  UPCOMING="No upcoming"  # ← This will show "No upcoming" if script runs but no data
  sketchybar --set "$NAME" \
    label="$UPCOMING" \
    icon.color=0x88888888 \
    label.color=0x88888888
else
  # ... rest same

  sketchybar --set "$NAME" \
    label="$UPCOMING" \
    icon.color=0xfff38ba8 \
    label.color=0xfff38ba8
fi
