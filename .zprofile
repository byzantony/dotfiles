# Auto start Hyprland on tty1
if [[ -z "$WAYLAND_DISPLAY" && "$XDG_VTNR" -eq 1 ]]; then
    exec dbus-launch --exit-with-session start-hyprland
fi

# SSH Agent
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519_sk_rk
fi

# === SSH / Yubikey Setup ===
unset SSH_ASKPASS
export SSH_ASKPASS_REQUIRE=never

# Start ssh-agent only if not already running
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
fi

# Add your Yubikey SSH key (fails silently if not inserted)
ssh-add ~/.ssh/id_ed25519_sk_rk 2>/dev/null || true

# Use keychain to manage the agent across sessions (recommended)
eval $(keychain --eval --quiet --agents ssh ~/.ssh/id_ed25519_sk_rk)
