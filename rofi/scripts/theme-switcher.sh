#!/usr/bin/env bash

THEME_DIR="/home/arunachalam/rofi-themes-collection/themes"
ACTIVE_FILE="$HOME/.config/rofi/active-theme"

# Get list of themes
mapfile -t THEMES < <(find "$THEME_DIR" -maxdepth 1 -name "*.rasi" -printf "%f\n" | sort)

[[ ${#THEMES[@]} -eq 0 ]] && exit 1

# Show rofi selection
SEL=$(printf '%s\n' "${THEMES[@]}" | rofi -dmenu -p "Select Rofi Theme")

[[ -z "$SEL" ]] && exit 0

# Save selected theme
echo "$THEME_DIR/$SEL" > "$ACTIVE_FILE"

notify-send "Rofi Theme Set" "$SEL"
