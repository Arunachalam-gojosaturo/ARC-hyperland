# 🔵 ARC-Hyperland
### Iron Man Inspired Hyprland Setup for Arch Linux

> Minimal. Reactive. Clean. Fully Automated.
> Structured Hyprland rice built for Arch power users.

---

## 📸 Preview

> Add screenshots after pushing

```md
![Desktop Preview](assets/preview.png)
```

---

## ✨ Features

- ⚡ Hyprland 0.53.3 Compatible
- 🔵 Arc Reactor Blue HUD Theme
- 🧠 Dynamic Rofi Theme Switcher
- 🖼️ Wallpaper Picker with Thumbnails (SUPER + W)
- 🔒 Styled Hyprlock
- 📊 Waybar Iron Man HUD
- 🔋 Battery, CPU, Memory Modules
- 🎛️ Wlogout Power Menu
- 👆 3-Finger Workspace Gestures
- 🚀 One-Command Install Script
- 🧩 Modular Config Structure

---

## 🖥 Environment

| Component | Version |
|------------|----------|
| OS | Arch Linux |
| WM | Hyprland 0.53.3 |
| Bar | Waybar |
| Launcher | Rofi |
| Lock | Hyprlock |
| Idle | Hypridle |
| Wallpaper | swww |
| Terminal | Kitty |
| Shell | Zsh |

---

## 🎮 Keybindings

| Key | Action |
|------|--------|
| SUPER + RETURN | Open Kitty |
| SUPER + E | File Manager |
| SUPER + SPACE | App Launcher |
| SUPER + SHIFT + A | Rofi Theme Switcher |
| SUPER + W | Wallpaper Picker |
| SUPER + SHIFT + E | Power Menu |
| SUPER + Q | Close Window |
| SUPER + F | Fullscreen |
| SUPER + H/J/K/L | Move Focus |
| SUPER + SHIFT + H/J/K/L | Move Window |

---

## 📦 Installation (Automatic)

### 1️⃣ Clone Repository

```bash
git clone https://github.com/Arunachalam-gojosaturo/ARC-hyperland.git
cd ARC-hyperland
```

### 2️⃣ Run Installer

```bash
chmod +x install.sh
./install.sh
```

Installer will:

- Install required packages
- Backup existing configs
- Copy dotfiles
- Setup gestures
- Enable services
- Reload Hyprland

---

## 📦 Required Packages

All packages listed in:

```
packages.txt
```

Install manually:

```bash
sudo pacman -S --needed - < packages.txt
```

---

## 🖼 Wallpaper System

Trigger:

```
SUPER + W
```

Place wallpapers in:

```
~/Pictures/Wallpapers/IronMan
```

Supported formats:

- JPG
- PNG
- JPEG

Uses:
- ImageMagick (thumbnail generation)
- swww (animated transitions)

---

## 🎨 Rofi Theme Switcher

Trigger:

```
SUPER + SHIFT + A
```

Themes stored in:

```
rofi-themes-collection/themes
```

Dynamic theme loading — no restart required.

---

## 📂 Folder Structure

```
ARC-hyperland/
│
├── hypr/
│   ├── hyprland.conf
│   ├── hyprlock.conf
│   ├── hypridle.conf
│   ├── ironman-theme.conf
│   └── scripts/
│
├── waybar/
│   ├── config.jsonc
│   └── style.css
│
├── rofi/
│   └── scripts/
│
├── wlogout/
│
├── install.sh
├── packages.txt
└── README.md
```

---

## 🔧 Useful Commands

Reload Hyprland:

```bash
hyprctl reload
```

Restart Waybar:

```bash
pkill waybar && waybar &
```

Check active keybinds:

```bash
hyprctl binds
```

---

## ⚠ Notes

- Designed specifically for Arch Linux
- Wayland only
- Blur requires proper GPU drivers
- Tested on Intel iGPU

---

## 🛠 Debug Philosophy

This setup follows:

- Modular configuration
- Clean separation of components
- Script-based automation
- Reproducible installation
- Minimal dependency bloat

---

## 📌 Roadmap

- [ ] GTK Theme Pack
- [ ] Nvidia Optimization Guide
- [ ] Screenshot Utility
- [ ] Auto Backup Script
- [ ] One-click Restore

---

## 👤 Author

Arunachalam  
Arch Linux Power User  
Hyprland Customizer  

GitHub:
https://github.com/Arunachalam-gojosaturo

---

## 🪪 License

MIT License

---

If you like this setup, consider ⭐ starring the repository.
