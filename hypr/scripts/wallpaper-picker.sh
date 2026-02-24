
#!/usr/bin/env bash
# Wallpaper Picker — Dynamic Rofi Themed Version (Super + W)

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/IronMan"
CACHE="$HOME/.cache/wallpaper-picker"
CURRENT="$HOME/.cache/current-wallpaper"
THEME_FILE="$HOME/.config/rofi/active-theme"

mkdir -p "$CACHE"

# -----------------------------
# Dependency checks
# -----------------------------
for cmd in magick swww rofi; do
    command -v "$cmd" >/dev/null 2>&1 || {
        notify-send "Error" "$cmd not installed"
        exit 1
    }
done

# -----------------------------
# Generate thumbnail
# -----------------------------
thumb() {
    local img="$1"
    local hash
    hash=$(echo "$img" | md5sum | cut -d' ' -f1)
    local out="$CACHE/$hash.jpg"

    if [[ ! -f "$out" ]]; then
        magick "$img" -thumbnail 500x300^ \
            -gravity center -extent 500x300 \
            "$out"
    fi

    echo "$out"
}

# -----------------------------
# Collect wallpapers
# -----------------------------
mapfile -t WALLS < <(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
    \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) \
    | sort
)

[[ ${#WALLS[@]} -eq 0 ]] && {
    notify-send "No Wallpapers Found"
    exit 1
}

# -----------------------------
# Build rofi menu input
# -----------------------------
INPUT=""
for w in "${WALLS[@]}"; do
    base=$(basename "$w")
    icon=$(thumb "$w")
    INPUT+="${base}\0icon\x1f${icon}\n"
done

# -----------------------------
# Load active rofi theme (dynamic)
# -----------------------------
ROFI_CMD="rofi -dmenu -show-icons -lines 8 -columns 2 -p 'Select Wallpaper'"

if [[ -f "$THEME_FILE" ]]; then
    ACTIVE_THEME=$(cat "$THEME_FILE")
    [[ -f "$ACTIVE_THEME" ]] && ROFI_CMD+=" -theme \"$ACTIVE_THEME\""
fi

# -----------------------------
# Show rofi menu
# -----------------------------
SEL=$(printf '%b' "$INPUT" | eval "$ROFI_CMD")

[[ -z "$SEL" ]] && exit 0

# -----------------------------
# Match selected wallpaper
# -----------------------------
for w in "${WALLS[@]}"; do
    [[ "$(basename "$w")" == "$SEL" ]] && TARGET="$w" && break
done

[[ -z "$TARGET" ]] && exit 1

# -----------------------------
# Apply wallpaper
# -----------------------------
swww img "$TARGET" \
    --transition-type random \
    --transition-duration 1.2 \
    --transition-fps 60

echo "$TARGET" > "$CURRENT"

notify-send "Wallpaper Changed" "$(basename "$TARGET")"
