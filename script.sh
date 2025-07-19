890511#!/bin/bash

echo "Installing packages..."
if yay -Syyu --noconfirm fish vesktop hyprland hyprshot fastfetch grim slurp hyprpolkitagent spotify spicetify-cli betterbird-bin keepassxc steam waybar nautilus hyprpaper ghostty ttf-jetbrains-mono-nerd; then
    echo "ok"
    cd ~/ || exit
    sudo mkdir -p clones
    cd clones
    sudo rm -rf dotfiles
    sudo git clone https://github.com/ntrop6/dotfiles.git && \
    sudo cp -rf ~/clones/dotfiles/* ~/.config/
    echo "copied succesfully?"
else
    echo
    read -p "Error Continue anyway? (Y/N) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Continuing..."
        cd ~/ || exit
        sudo mkdir -p clones
        cd clones/
        sudo rm -rf dotfiles
        sudo git clone https://github.com/ntrop6/dotfiles.git && \
        sudo cp -rf ~/clones/dotfiles/* ~/.config/
        echo "ok"
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "ok go fix your shit."
        exit
    else
        echo "ok go fix your shit."
        exit
    fi
fi
