#!/bin/bash

# Directories to search for apps
app_dirs=(
  "/Applications"
  "/System/Applications"
  "$HOME/Applications"
)

echo "Listing all installed apps with their bundle identifiers..."

for dir in "${app_dirs[@]}"; do
  if [ -d "$dir" ]; then
    find "$dir" -type d -name "*.app" | while read -r app_path; do
      # Path to Info.plist inside the app bundle
      plist="$app_path/Contents/Info.plist"
      if [ -f "$plist" ]; then
        # Extract CFBundleIdentifier using PlistBuddy
        bundle_id=$(/usr/libexec/PlistBuddy -c "Print CFBundleIdentifier" "$plist" 2>/dev/null)
        app_name=$(basename "$app_path" .app)
        if [ -n "$bundle_id" ]; then
          echo "$app_name : $bundle_id"
        else
          echo "$app_name : (no bundle identifier found)"
        fi
      fi
    done
  fi
done
