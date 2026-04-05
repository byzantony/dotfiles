#!/bin/bash

STATUS=$(tailscale status --json 2>/dev/null)
BACKEND=$(echo "$STATUS" | jq -r '.BackendState')
EXIT_NODE=$(echo "$STATUS" | jq -r '.ExitNodeStatus // empty')

if [ "$BACKEND" = "Running" ] && [ -n "$EXIT_NODE" ]; then
    STATE="● VPN Active (Exit Node)"
elif [ "$BACKEND" = "Running" ]; then
    STATE="● Tailscale Connected (LAN)"
else
    STATE="○ Tailscale Off"
fi

CHOICE=$(echo -e "$STATE\n─────────────\nEnable Exit Node\nDisable Exit Node\nDisconnect Tailscale\nConnect Tailscale\nShow Status" | \
    rofi -dmenu \
         -p "Tailscale" \
         -theme-str 'window {width: 350px;}' \
         -theme-str 'listview {lines: 7;}' \
         -i)

case "$CHOICE" in
    "Enable Exit Node")
        sudo tailscale up --exit-node=100.109.132.112 --exit-node-allow-lan-access --accept-dns=true --accept-risk=linux-strict-rp-filter
        notify-send "Tailscale" "Exit node enabled" ;;
    "Disable Exit Node")
        sudo tailscale up --exit-node="" --accept-dns=true
        notify-send "Tailscale" "Exit node disabled" ;;
    "Disconnect Tailscale")
        sudo tailscale down
        notify-send "Tailscale" "Disconnected" ;;
    "Connect Tailscale")
        sudo tailscale up --accept-dns=true
        notify-send "Tailscale" "Connected" ;;
    "Show Status")
        notify-send "Tailscale Status" "$(tailscale status)" ;;
esac
