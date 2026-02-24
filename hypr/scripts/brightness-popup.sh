#!/usr/bin/env bash

CURRENT=$(brightnessctl -m | cut -d',' -f4)

NEW=$(rofi -dmenu -p "Brightness (0-100)" -mesg "Current: $CURRENT" <<< "")

if [[ -n "$NEW" ]]; then
    brightnessctl set "$NEW%"
fi
