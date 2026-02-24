#!/usr/bin/env bash

# ══════════════════════════════════════════════════════════════════════════════
#  ARC-HYPERLAND Installer — Iron Man Edition
#  Author  : Arunachalam
#  GitHub  : github.com/Arunachalam-gojosaturo
#  Instagram: @saturogojo_ac
# ══════════════════════════════════════════════════════════════════════════════

set -e

# ─────────────────────────────────────────────
#  COLORS & STYLES
# ─────────────────────────────────────────────
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"

BLACK="\033[0;30m"
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"

BG_BLACK="\033[40m"
BG_CYAN="\033[46m"

# ─────────────────────────────────────────────
#  STEP COUNTER
# ─────────────────────────────────────────────
STEP=0
TOTAL=12

step_next() {
    STEP=$((STEP + 1))
}

# ─────────────────────────────────────────────
#  PRINT HELPERS
# ─────────────────────────────────────────────

# Blank line
nl() { echo ""; }

# Full-width divider
divider() {
    echo -e "${DIM}${CYAN}  ══════════════════════════════════════════════════════════════════════════════════════════════════  ${RESET}"
}

thin_divider() {
    echo -e "${DIM}  ──────────────────────────────────────────────────────────────────────────────────────────────────  ${RESET}"
}

# Section header  e.g.  ❯ 03/12  INSTALLING PACKAGES
section() {
    local label="$1"
    nl
    divider
    printf "${CYAN}${BOLD}  ❯ %02d/%02d  ${WHITE}${BOLD}%-55s${RESET}\n" "$STEP" "$TOTAL" "$label"
    divider
    nl
}

# Status messages
ok()   { echo -e "  ${GREEN}${BOLD}  ✔  ${RESET}${WHITE}$1${RESET}"; }
warn() { echo -e "  ${YELLOW}${BOLD}  ⚠  ${RESET}${YELLOW}$1${RESET}"; }
err()  { echo -e "  ${RED}${BOLD}  ✖  ${RESET}${RED}$1${RESET}"; }
info() { echo -e "  ${CYAN}  ›  ${RESET}${DIM}$1${RESET}"; }
run()  { echo -e "  ${DIM}${CYAN}  »  ${WHITE}$1${RESET}"; }

# Progress bar  usage: progress 3 12
progress() {
    local current=$1
    local total=$2
    local width=50
    local filled=$(( current * width / total ))
    local empty=$(( width - filled ))
    local pct=$(( current * 100 / total ))

    local bar=""
    for ((i=0; i<filled; i++)); do bar+="█"; done
    for ((i=0; i<empty;  i++)); do bar+="░"; done

    printf "  ${CYAN}  [${GREEN}${BOLD}%s${CYAN}] ${WHITE}%3d%%  ${DIM}(%d/%d)${RESET}\n" "$bar" "$pct" "$current" "$total"
}

# Animated spinner  usage: spinner "message" & PID=$! ; ... ; kill $PID
spinner() {
    local msg="$1"
    local frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    local i=0
    while true; do
        printf "\r  ${CYAN}${BOLD}  %s  ${RESET}${WHITE}%s${RESET}   " "${frames[$((i % 10))]}" "$msg"
        sleep 0.1
        ((i++))
    done
}

# ─────────────────────────────────────────────
#  MAIN BANNER
# ─────────────────────────────────────────────

clear

echo ""
echo -e "${CYAN}${BOLD}"
cat << 'BANNER'
╔══════════════════════════════════════════════════════════════════════════════════════════════════╗
║                                                                                                  ║
║                                      █████╗ ██████╗  ██████╗                                    ║
║                                     ██╔══██╗██╔══██╗██╔════╝                                    ║
║                                     ███████║██████╔╝██║                                         ║
║                                     ██╔══██║██╔══██╗██║                                         ║
║                                     ██║  ██║██║  ██║╚██████╗                                    ║
║                                     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝                                    ║
║                                                                                                  ║
║            ██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗ ██╗      █████╗ ███╗  ██╗██████╗            ║
║            ██║  ██║╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██║     ██╔══██╗████╗ ██║██╔══██╗           ║
║            ███████║ ╚████╔╝ ██████╔╝█████╗  ██████╔╝██║     ███████║██╔██╗██║██║  ██║           ║
║            ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗██║     ██╔══██║██║╚████║██║  ██║           ║
║            ██║  ██║   ██║   ██║     ███████╗██║  ██║███████╗██║  ██║██║ ╚███║██████╔╝           ║
║            ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚══╝╚═════╝           ║
║                                                                                                  ║
║          ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━         ║
║                  I R O N   M A N   E D I T I O N   ·   H Y P R L A N D   R I C E                ║
║          ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━         ║
║                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════╝
BANNER
echo -e "${RESET}"

# Info block under banner
echo -e "  ${DIM}${WHITE}  Author   ${CYAN}›  ${WHITE}Arunachalam${RESET}"
echo -e "  ${DIM}${WHITE}  GitHub   ${CYAN}›  ${WHITE}github.com/Arunachalam-gojosaturo${RESET}"
echo -e "  ${DIM}${WHITE}  Instagram ${CYAN}›  ${WHITE}@saturogojo_ac${RESET}"
nl
echo -e "  ${DIM}  ${RED}❝  ${ITALIC}Sometimes you gotta run before you can walk.${RESET}  ${RED}❞  ${DIM}— Tony Stark${RESET}"
nl

divider
echo -e "  ${CYAN}${BOLD}  SYSTEM CHECK  ${RESET}${DIM}Initializing ARC Reactor...${RESET}"
divider
nl

sleep 1

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 01 — ARCH LINUX CHECK
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "ARCH LINUX DETECTION"
progress $STEP $TOTAL

if ! grep -q "Arch" /etc/os-release 2>/dev/null; then
    err "This installer supports Arch Linux only."
    nl
    echo -e "  ${DIM}Detected OS:${RESET}"
    cat /etc/os-release | grep PRETTY_NAME | sed 's/^/  /'
    nl
    exit 1
fi

ok "Arch Linux detected"
info "Proceeding with installation..."
sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 02 — SYSTEM UPDATE (optional prompt)
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "SYSTEM UPDATE"
progress $STEP $TOTAL

echo -e "  ${YELLOW}${BOLD}  ?  ${RESET}${WHITE}Sync pacman mirrors before install? ${DIM}[y/N]${RESET} " && read -r SYNC_CHOICE

if [[ "$SYNC_CHOICE" =~ ^[Yy]$ ]]; then
    run "sudo pacman -Sy"
    sudo pacman -Sy
    ok "Mirror list refreshed"
else
    info "Skipping mirror sync"
fi

sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 03 — INSTALL CORE PACKAGES
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "INSTALLING CORE PACKAGES"
progress $STEP $TOTAL

PACKAGES=(
    hyprland waybar rofi wlogout
    grim slurp wl-clipboard swappy
    brightnessctl pamixer pavucontrol
    swww imagemagick
    networkmanager network-manager-applet
    blueman dunst
    kitty thunar
    git base-devel
)

echo -e "  ${DIM}  Packages queued:${RESET}"
nl
for pkg in "${PACKAGES[@]}"; do
    printf "    ${CYAN}◆${RESET}  ${WHITE}%-30s${RESET}\n" "$pkg"
done
nl

run "sudo pacman -S --needed --noconfirm ${PACKAGES[*]}"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

sudo systemctl enable NetworkManager --now 2>/dev/null || true

ok "Core packages installed"
sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 04 — INSTALL YAY (AUR HELPER)
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "AUR HELPER — YAY"
progress $STEP $TOTAL

if ! command -v yay >/dev/null 2>&1; then
    info "yay not found — building from AUR..."
    nl
    run "git clone https://aur.archlinux.org/yay.git"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    run "makepkg -si --noconfirm"
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
    ok "yay installed successfully"
else
    ok "yay already present — skipping"
fi

sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 05 — AUR PACKAGES
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "INSTALLING AUR PACKAGES"
progress $STEP $TOTAL

info "Installing libinput-gestures for 3-finger workspace switching..."
run "yay -S --needed --noconfirm libinput-gestures"
yay -S --needed --noconfirm libinput-gestures || warn "libinput-gestures install failed — gestures may not work"

ok "AUR packages installed"
sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 06 — BACKUP EXISTING CONFIG
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "BACKING UP EXISTING CONFIG"
progress $STEP $TOTAL

BACKUP=~/.config/arc_backup_$(date +%Y%m%d_%H%M%S)
mkdir -p "$BACKUP"

BACKED=0
for dir in hypr waybar rofi wlogout; do
    if [ -d ~/.config/$dir ]; then
        run "mv ~/.config/$dir → $BACKUP/$dir"
        mv ~/.config/$dir "$BACKUP/$dir"
        ok "Backed up: ~/.config/$dir"
        BACKED=$((BACKED + 1))
    else
        info "Not found (skipping): ~/.config/$dir"
    fi
done

nl
if [ $BACKED -gt 0 ]; then
    ok "Backup complete → ${BACKUP}"
else
    info "No existing configs to back up"
fi

sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 07 — DEPLOY ARC DOTFILES
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "DEPLOYING ARC DOTFILES"
progress $STEP $TOTAL

DOTFILES=(hypr waybar rofi wlogout)
mkdir -p ~/.config

for dir in "${DOTFILES[@]}"; do
    if [ -d "$dir" ]; then
        run "cp -r $dir → ~/.config/$dir"
        cp -r "$dir" ~/.config/
        ok "Deployed: $dir"
    else
        warn "Source folder not found: $dir — skipping"
    fi
done

# Make scripts executable
chmod +x ~/.config/hypr/scripts/*.sh   2>/dev/null && ok "hypr scripts → executable" || true
chmod +x ~/.config/rofi/scripts/*.sh   2>/dev/null && ok "rofi scripts → executable" || true

sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 08 — USER PERMISSIONS
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "FIXING USER PERMISSIONS"
progress $STEP $TOTAL

run "sudo usermod -aG video $USER"
sudo usermod -aG video "$USER" 2>/dev/null && ok "Added $USER → video group" || warn "Could not modify video group"

run "sudo gpasswd -a $USER input"
sudo gpasswd -a "$USER" input 2>/dev/null && ok "Added $USER → input group" || warn "Could not modify input group"

sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 09 — DIRECTORIES
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "SETTING UP DIRECTORIES"
progress $STEP $TOTAL

DIRS=(
    ~/Pictures/Screenshots
    ~/Pictures/Wallpapers/IronMan
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    ok "Ready: $dir"
done

sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 10 — SWWW WALLPAPER DAEMON
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "WALLPAPER DAEMON — SWWW"
progress $STEP $TOTAL

if ! pgrep swww-daemon >/dev/null 2>&1; then
    run "swww-daemon &"
    swww-daemon &
    disown
    sleep 0.5
    ok "swww-daemon launched"
else
    ok "swww-daemon already running"
fi

sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 11 — HARDWARE DETECTION
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "HARDWARE DETECTION"
progress $STEP $TOTAL

# Backlight
BACKLIGHT=$(ls /sys/class/backlight 2>/dev/null | head -n1)
if [ -n "$BACKLIGHT" ]; then
    ok "Backlight device → $BACKLIGHT"
else
    warn "No backlight device detected — brightness keys may not work"
fi

# GPU detection
GPU_INFO=$(lspci 2>/dev/null | grep -iE "vga|3d|display" | head -n1 | sed 's/.*: //')
if [ -n "$GPU_INFO" ]; then
    ok "GPU detected → $GPU_INFO"
    if echo "$GPU_INFO" | grep -qi nvidia; then
        warn "Nvidia GPU detected — manual nvidia-hyprland config may be needed"
    fi
else
    info "GPU info not available"
fi

# Hyprland check
if hyprctl version >/dev/null 2>&1; then
    HYPR_VER=$(hyprctl version | grep -oP 'v[0-9]+\.[0-9]+\.[0-9]+' | head -n1)
    ok "Hyprland detected → $HYPR_VER"
else
    info "Hyprland not running yet — will be available after reboot/session start"
fi

sleep 0.5

# ══════════════════════════════════════════════════════════════════════════════
#  STEP 12 — FINAL SUMMARY
# ══════════════════════════════════════════════════════════════════════════════

step_next
section "INSTALLATION COMPLETE"
progress $STEP $TOTAL

nl
echo -e "${CYAN}${BOLD}"
cat << 'EOF'
  ╔══════════════════════════════════════════════════════════════════════════════╗
  ║                                                                              ║
  ║    ██████╗ ██████╗ ███╗   ██╗███████╗    ██████╗  ██████╗ ███╗  ██╗███████╗ ║
  ║   ██╔══██╗██╔══██╗████╗  ██║██╔════╝    ██╔══██╗██╔═══██╗████╗ ██║██╔════╝ ║
  ║   ██║  ██║██║  ██║██╔██╗ ██║█████╗      ██║  ██║██║   ██║██╔██╗██║█████╗   ║
  ║   ██║  ██║██║  ██║██║╚████║██╔══╝       ██║  ██║██║   ██║██║╚████║██╔══╝   ║
  ║   ██████╔╝██████╔╝██║ ╚███║███████╗     ██████╔╝╚██████╔╝██║ ╚███║███████╗ ║
  ║   ╚═════╝ ╚═════╝ ╚═╝  ╚══╝╚══════╝     ╚═════╝  ╚═════╝ ╚═╝  ╚══╝╚══════╝ ║
  ║                                                                              ║
  ╚══════════════════════════════════════════════════════════════════════════════╝
EOF
echo -e "${RESET}"

thin_divider
echo -e "  ${GREEN}${BOLD}  ✔  ${RESET}${WHITE}${BOLD}Installation Summary${RESET}"
thin_divider
nl
echo -e "    ${CYAN}◆  ${WHITE}Core packages    ${GREEN}✔ installed${RESET}"
echo -e "    ${CYAN}◆  ${WHITE}AUR packages     ${GREEN}✔ installed${RESET}"
echo -e "    ${CYAN}◆  ${WHITE}Configs deployed ${GREEN}✔ ~/.config/{hypr,waybar,rofi,wlogout}${RESET}"
echo -e "    ${CYAN}◆  ${WHITE}Permissions      ${GREEN}✔ video + input groups${RESET}"
echo -e "    ${CYAN}◆  ${WHITE}Directories      ${GREEN}✔ Screenshots · Wallpapers/IronMan${RESET}"
echo -e "    ${CYAN}◆  ${WHITE}swww daemon      ${GREEN}✔ running${RESET}"
nl
thin_divider
nl
echo -e "  ${YELLOW}${BOLD}  ⚠  ${RESET}${YELLOW}${BOLD}Reboot recommended${RESET}${DIM} — group changes require a fresh session${RESET}"
nl
thin_divider
nl
echo -e "  ${DIM}  Quick Commands:${RESET}"
echo -e "    ${CYAN}  hyprctl reload${RESET}${DIM}        →  reload Hyprland config${RESET}"
echo -e "    ${CYAN}  pkill waybar && waybar &${RESET}${DIM} →  restart status bar${RESET}"
echo -e "    ${CYAN}  hyprctl binds${RESET}${DIM}         →  list all keybinds${RESET}"
nl
thin_divider
nl
echo -e "  ${WHITE}${BOLD}  Follow for updates:${RESET}"
echo -e "    ${CYAN}  GitHub    ${WHITE}›${RESET}  ${DIM}github.com/Arunachalam-gojosaturo${RESET}"
echo -e "    ${RED}  Instagram ${WHITE}›${RESET}  ${DIM}@saturogojo_ac${RESET}"
nl
divider
nl
echo -e "  ${RED}${BOLD}  ❝  ${ITALIC}I am Iron Man.${RESET}  ${RED}${BOLD}❞${RESET}${DIM}  — Tony Stark${RESET}"
nl
echo -e "  ${CYAN}${BOLD}  ⚡  Welcome to the ARC Reactor. Suit up.${RESET}"
nl
divider
nl
