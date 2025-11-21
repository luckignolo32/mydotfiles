#!/bin/bash
#
# install.sh - Installation script for luckignolo32's dotfiles
#
# This script installs all necessary packages and uses 'stow' to create
# symlinks for the configuration files, as described in the README.
#
# ASSUMPTION: This script is run from inside the 'mydotfiles-main' directory.
#

# --- Helper function for logging ---
step() {
  echo -e "\n--- $1 ---"
}

# --- Sudo Check ---
step "Checking for sudo privileges..."
sudo -v
if [ $? -ne 0 ]; then
  echo "Failed to get sudo privileges. Exiting."
  exit 1
fi

# --- Install Core Dependencies ---
step "Installing Core Dependencies (stow, git, curl)"
sudo pacman -S --needed --noconfirm stow git curl

# --- 1. Zsh & zshrc ---
step "Processing Zsh"
# 1. Download the program
sudo pacman -S --needed --noconfirm zsh
# 2. Remove default config (if needed)
rm -f ~/.zshrc
# 3. Stow the program
stow zshrc
# 4. Other (Install nvm dependency from .zshrc)
echo "Installing nvm (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
echo "NOTE: nvm installed. You may need to restart your shell to use it."

# --- 2. Hyprland ---
step "Processing Hyprland"
# 1. Download the program
sudo pacman -S --needed --noconfirm hyprland xdg-desktop-portal-hyprland
# 2. Remove default config (if needed)
rm -rf ~/.config/hypr
# 3. Stow the program
stow hyprland
# 4. Other (Install dependencies from hyprland.conf)
echo "Installing Hyprland dependencies..."
sudo pacman -S --needed --noconfirm \
  kitty \
  dolphin \
  wofi \
  waybar \
  swaync \
  hypridle \
  hyprpaper \
  hyprlock \
  hyprshot \
  wireplumber \
  brightnessctl \
  playerctl \
  wlogout \
  zen
echo "NOTE: 'google-chrome-stable' and 'nordvpn' must be installed from the AUR (e.g., using 'yay')."

# --- 3. hypridle ---
step "Processing hypridle"
# 1. Download the program (already installed as Hyprland dep)
sudo pacman -S --needed --noconfirm hypridle
# 2. Remove default config (already removed with Hyprland)
# 3. Stow the program
stow hypridle
# 4. Other (none)

# --- 4. hyprlock ---
step "Processing hyprlock"
# 1. Download the program (already installed as Hyprland dep)
sudo pacman -S --needed --noconfirm hyprlock
# 2. Remove default config (already removed with Hyprland)
# 3. Stow the program
stow hyprlock
# 4. Other (Install font from hyprlock.conf)
echo "Installing font: JetBrainsMono Nerd Font"
sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd

# --- 5. hyprpaper ---
step "Processing hyprpaper"
# 1. Download the program (already installed as Hyprland dep)
sudo pacman -S --needed --noconfirm hyprpaper
# 2. Remove default config (already removed with Hyprland)
# 3. Stow the program
stow hyprpaper
# 4. Other (none)

# --- 6. fastfetch ---
step "Processing fastfetch"
# 1. Download the program
sudo pacman -S --needed --noconfirm fastfetch
# 2. Remove default config (if needed)
rm -rf ~/.config/fastfetch
# 3. Stow the program
stow fastfetch
# 4. Other (none)

# --- 7. kitty ---
step "Processing kitty"
# 1. Download the program (already installed as Hyprland dep)
sudo pacman -S --needed --noconfirm kitty
# 2. Remove default config (if needed)
rm -rf ~/.config/kitty
# 3. Stow the program
stow kitty
# 4. Other (Install font from kitty.conf)
echo "Installing font: CaskaydiaCove Nerd Font"
sudo pacman -S --needed --noconfirm ttf-caskaydia-cove-nerd

# --- 8. starship ---
step "Processing starship"
# 1. Download the program
sudo pacman -S --needed --noconfirm starship
# 2. Remove default config (if needed)
rm -f ~/.config/starship.toml
# 3. Stow the program
stow starship
# 4. Other (none)

# --- 9. swayimg ---
step "Processing swayimg"
# 1. Download the program
sudo pacman -S --needed --noconfirm swayimg
# 2. Remove default config (if needed)
rm -rf ~/.config/swayimg
# 3. Stow the program
stow swayimg
# 4. Other (none)

# --- 10. swaync ---
step "Processing swaync"
# 1. Download the program (already installed as Hyprland dep)
sudo pacman -S --needed --noconfirm swaync
# 2. Remove default config (if needed)
rm -rf ~/.config/swaync
# 3. Stow the program
stow swaync
# 4. Other (none)

# --- 11. waybar ---
step "Processing waybar"
# 1. Download the program (already installed as Hyprland dep)
sudo pacman -S --needed --noconfirm waybar
# 2. Remove default config (if needed)
rm -rf ~/.config/waybar
# 3. Stow the program
stow waybar
# 4. Other (Install font from style.css)
echo "Installing font: MesloLGS Nerd Font"
sudo pacman -S --needed --noconfirm ttf-meslo-nerd

# --- 12. wofi ---
step "Processing wofi"
# 1. Download the program (already installed as Hyprland dep)
sudo pacman -S --needed --noconfirm wofi
# 2. Remove default config (if needed)
rm -rf ~/.config/wofi
# 3. Stow the program
stow wofi
# 4. Other (font already installed with kitty)

# --- Finalization ---
step "Installation Complete!"
echo "All dotfiles have been stowed and dependencies installed."
echo "Please restart your shell or reboot for all changes to take effect."
echo "Remember to install AUR packages if needed (e.g., 'yay -S google-chrome-stable nordvpn-bin')."
