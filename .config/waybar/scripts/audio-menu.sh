#!/bin/bash

# Get current volume and mute status
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP '(?<=Mute: )\w+')

# Get current source (microphone) volume
MIC_VOLUME=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -oP '\d+(?=%)' | head -1)
MIC_MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -oP '(?<=Mute: )\w+')

# Build menu
if [ "$MUTED" = "yes" ]; then
    MUTE_LABEL="󰕾 Unmute Output"
else
    MUTE_LABEL="󰝟 Mute Output"
fi

if [ "$MIC_MUTED" = "yes" ]; then
    MIC_LABEL="󰍬 Unmute Mic"
else
    MIC_LABEL="󰍭 Mute Mic"
fi

CHOICE=$(echo -e "󰕾 Volume: ${VOLUME}%\n󰍬 Mic: ${MIC_VOLUME}%\n─────────────\n󰝠 Volume +5\n󰝞 Volume -5\n${MUTE_LABEL}\n─────────────\n${MIC_LABEL}\n─────────────\n󰕾 Open Mixer" | \
    rofi -dmenu \
         -p "Audio" \
         -theme-str 'window {width: 300px;}' \
         -theme-str 'listview {lines: 10;}' \
         -i)

case "$CHOICE" in
    "󰝠 Volume +5")
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        notify-send "Volume" "$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)%" ;;
    "󰝞 Volume -5")
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        notify-send "Volume" "$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)%" ;;
    "󰝟 Mute Output")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        notify-send "Audio" "Output muted" ;;
    "󰕾 Unmute Output")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        notify-send "Audio" "Output unmuted" ;;
    "󰍭 Mute Mic")
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
        notify-send "Audio" "Mic muted" ;;
    "󰍬 Unmute Mic")
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
        notify-send "Audio" "Mic unmuted" ;;
    "󰕾 Open Mixer")
        pavucontrol ;;
esac
