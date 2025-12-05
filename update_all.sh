#!/bin/bash

# -----------------------------------------------------------------------------
# Arch Linux Universal Update Script
# Covers: Pacman, AUR (via yay/paru), Flatpak, and Snap
# -----------------------------------------------------------------------------

# Colors for formatting
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print section headers
print_header() {
    echo -e "\n${BLUE}=========================================${NC}"
    echo -e "${GREEN}$1${NC}"
    echo -e "${BLUE}=========================================${NC}\n"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# -----------------------------------------------------------------------------
# 1. System & AUR Updates (Pacman/Yay/Paru)
# -----------------------------------------------------------------------------
print_header "Updating System Packages & AUR..."

# Check for common AUR helpers.
# We prefer using the helper because they wrap pacman and update AUR simultaneously.
if command_exists yay; then
    echo -e "${YELLOW}Detected 'yay'. Running full system upgrade...${NC}"
    yay
elif command_exists paru; then
    echo -e "${YELLOW}Detected 'paru'. Running full system upgrade...${NC}"
    paru
else
    echo -e "${YELLOW}No AUR helper (yay/paru) detected.${NC}"
    echo -e "${YELLOW}Running standard Pacman update (AUR packages will NOT be updated)...${NC}"
    sudo pacman -Syu
fi

# -----------------------------------------------------------------------------
# 2. Flatpak Updates
# -----------------------------------------------------------------------------
if command_exists flatpak; then
    print_header "Updating Flatpaks..."
    flatpak update
    
    # Optional: Remove unused runtimes to save space
    echo -e "\n${YELLOW}Cleaning unused Flatpak runtimes...${NC}"
    flatpak uninstall --unused
else
    echo -e "\n${RED}Flatpak not installed. Skipping.${NC}"
fi

# -----------------------------------------------------------------------------
# 3. Snap Updates
# -----------------------------------------------------------------------------
if command_exists snap; then
    print_header "Updating Snaps..."
    sudo snap refresh
else
    echo -e "\n${RED}Snap not installed. Skipping.${NC}"
fi

# -----------------------------------------------------------------------------
# Completion
# -----------------------------------------------------------------------------
echo -e "\n${BLUE}=========================================${NC}"
echo -e "${GREEN}All updates complete!${NC}"
echo -e "${BLUE}=========================================${NC}"
