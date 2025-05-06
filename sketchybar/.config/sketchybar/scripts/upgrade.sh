# Navigate to the sketchybar config directory
cd $HOME/.config/sketchybar

# Upgrade sketchybar-app-font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.32/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Pull the latest changes
git pull

# Make sure scripts have the correct permissions
chmod +x scripts/*.sh

# Restart sketchybar
sketchybar --reload