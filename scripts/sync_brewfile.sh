#!/usr/bin/env bash

set -e  # Exit on any error

DOTFILES_DIR="$HOME/.dotfiles"
BREWFILE="$DOTFILES_DIR/homebrew/Brewfile"

# 1. Install Homebrew if needed
if ! command -v brew >/dev/null 2>&1; then
  echo "🚀 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Install packages from Brewfile
if [[ -f "$BREWFILE" ]]; then
  echo "📦 Installing packages from Brewfile..."
  brew bundle --file="$BREWFILE"
else
  echo "⚠️ No Brewfile found at $BREWFILE"
fi

# 3. Install GNU Stow if needed
if ! command -v stow >/dev/null 2>&1; then
  echo "🔧 Installing GNU Stow..."
  brew install stow
fi

# 4. Stow all dotfile packages
echo "🔗 Stowing dotfiles..."
cd "$DOTFILES_DIR"

# Loop through subdirectories (each is a stow package)
for dir in */; do
  stow "${dir%/}"
done

echo "✅ Done. Your environment is ready!"

