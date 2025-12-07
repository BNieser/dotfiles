#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"
ZSH_DIR="$DOTFILES/zsh"
OMZ_DIR="$ZSH_DIR/.oh-my-zsh"
PLUGIN_DIR="$OMZ_DIR/custom/plugins"

mkdir -p "$PLUGIN_DIR"

clone_or_update() {
    local repo_url="$1"
    local target_dir="$2"

    if [ -d "$target_dir/.git" ]; then
        echo "Updating $(basename "$target_dir") ..."
        git -C "$target_dir" pull --ff-only
    elif [ -d "$target_dir" ]; then
        echo "Directory $target_dir exists (not a git repo). Not touching it."
    else
        echo "Cloning $(basename "$target_dir") ..."
        git clone "$repo_url" "$target_dir"
    fi
}

# -------------------------------
# Ask for OS
# -------------------------------
echo "Which OS are you using?"
echo "1) Arch / Manjaro (yay preferred)"
echo "2) Debian / Ubuntu"
read -rp "Please enter the number: " OS_CHOICE

# -------------------------------
# Install autojump based on OS
# -------------------------------
install_autojump() {
    case "$OS_CHOICE" in
        1)
            echo "=== Arch/Manjaro ausgewählt ==="
            if command -v yay &>/dev/null; then
                if yay -Q autojump &>/dev/null; then
                    echo "autojump bereits installiert."
                else
                    yay -S --noconfirm autojump
                fi
            fi
            ;;
        2)
            echo "=== Debian/Ubuntu ausgewählt ==="
            if dpkg -s autojump &>/dev/null; then
                echo "autojump bereits installiert."
            else
                sudo apt update
                sudo apt install -y autojump
            fi
            ;;
        *)
            echo "Invalid selection!"
            exit 1
            ;;
    esac
}

# -------------------------------
# Actual installation
# -------------------------------

echo "=== Install/Update Oh My Zsh ==="
clone_or_update "https://github.com/ohmyzsh/ohmyzsh.git" "$OMZ_DIR"

echo "=== Install/Update Plugins ==="
clone_or_update "https://github.com/zsh-users/zsh-autosuggestions" \
    "$PLUGIN_DIR/zsh-autosuggestions"

clone_or_update "https://github.com/zsh-users/zsh-syntax-highlighting" \
    "$PLUGIN_DIR/zsh-syntax-highlighting"

clone_or_update "https://github.com/MichaelAquilina/zsh-you-should-use" \
    "$PLUGIN_DIR/you-should-use"

clone_or_update "https://github.com/fdellwing/zsh-bat" \
    "$PLUGIN_DIR/zsh-bat"

clone_or_update "https://github.com/jeffreytse/zsh-vi-mode" \
    "$PLUGIN_DIR/zsh-vi-mode"


echo "=== Install autojump ==="
install_autojump

echo "=== Done. Run: stow -R zsh ==="
