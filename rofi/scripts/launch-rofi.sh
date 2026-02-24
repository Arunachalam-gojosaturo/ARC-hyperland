#!/usr/bin/env bash

ACTIVE="$HOME/.config/rofi/active-theme"

if [[ -f "$ACTIVE" ]]; then
    THEME=$(cat "$ACTIVE")
else
    # Default theme if active-theme does not exist
    THEME="/home/arunachalam/rofi-themes-collection/themes/launchpad.rasi"
fi

exec rofi -show drun -theme "$THEME"
