#!/usr/bin/env bash
set -e

echo "======================================="
echo " Hyprland IronMan Dots Installer"
echo "======================================="

# Arch check
if ! command -v pacman &>/dev/null; then
    echo "❌ Arch-based distro required."
    exit 1
fi

# Install packages
echo "📦 Installing packages..."
sudo pacman -S --needed - < packages.txt

# Backup
BACKUP="$HOME/.config/backup_ironman_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP"

for dir in hypr waybar rofi wlogout; do
    if [ -d "$HOME/.config/$dir" ]; then
        mv "$HOME/.config/$dir" "$BACKUP/"
    fi
done

# Copy configs
echo "📂 Installing configs..."
cp -r hypr     "$HOME/.config/"
cp -r waybar   "$HOME/.config/"
cp -r rofi     "$HOME/.config/"
cp -r wlogout  "$HOME/.config/"

# Permissions
chmod +x "$HOME/.config/hypr/scripts/"* 2>/dev/null || true
chmod +x "$HOME/.config/rofi/scripts/"* 2>/dev/null || true

echo "======================================="
echo " Installation complete."
echo " Log out and back in."
echo "======================================="
