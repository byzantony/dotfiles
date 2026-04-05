#!/bin/bash

STATUS=$(tailscale status --json 2>/dev/null)

if [ -z "$STATUS" ]; then
    echo '{"text": "", "class": "off", "alt": "off", "tooltip": "Tailscale not running"}'
    exit
fi

BACKEND=$(echo "$STATUS" | jq -r '.BackendState')
EXIT_NODE=$(echo "$STATUS" | jq -r '.ExitNodeStatus // empty')

if [ "$BACKEND" != "Running" ]; then
    echo '{"text": "", "class": "off", "alt": "off", "tooltip": "Tailscale off"}'
elif [ -n "$EXIT_NODE" ]; then
    echo '{"text": "", "class": "vpn", "alt": "vpn", "tooltip": "VPN: Exit node active"}'
else
    echo '{"text": "", "class": "lan", "alt": "lan", "tooltip": "Tailscale: LAN only"}'
fi
