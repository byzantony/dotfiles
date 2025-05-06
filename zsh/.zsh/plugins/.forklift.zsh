# forklift.zsh

# Function to open files or folders in ForkLift 4
fl() {
  if [[ -z "$1" ]]; then
    echo "Usage: fl <file-or-folder-path>"
    return 1
  fi

  local target="$1"

  if [[ ! -e "$target" ]]; then
    echo "Error: '$target' does not exist."
    return 1
  fi

  # Convert to absolute path
  local abs_path="$(cd "$(dirname "$target")" && pwd)/$(basename "$target")"

  # Open in ForkLift 4 via AppleScript
  osascript <<EOF
tell application "ForkLift"
    activate
    open "$abs_path"
end tell
EOF
}

