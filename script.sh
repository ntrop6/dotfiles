#!/bin/bash

echo "Installing packages..."
if yay -Syyu --noconfirm fish vesktop hyprland-git hyprshot fastfetch grim slurp hyprpolkitagent-git spotify spicetify-cli betterbird-bin keepassxc steam waybar nautilus hyprpaper-git ghostty ttf-jetbrains-mono-nerd; then
    echo "Packages installed successfully. Proceeding with dotfiles configuration..."
    cd ~/ || exit
    sudo mkdir -p clones
    cd clones
    sudo rm -rf dotfiles
    sudo git clone https://github.com/ntrop6/dotfiles.git && \
    sudo cp -rf ~/clones/dotfiles/* ~/.config/
    echo "copied succesfully?"
else
    echo
    read -p "uh oh, something seems to have gone wrong. Continue anyway? (Y/N) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Continuing with dotfiles configuration despite package install failure..."
        cd ~/ || exit
        sudo mkdir -p clones
        cd clones/
        sudo rm -rf dotfiles
        sudo git clone https://github.com/ntrop6/dotfiles.git && \
        sudo cp -rf ~/clones/dotfiles/* ~/.config/
        echo "copied succesfully"
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "ok go fix your shit."
        exit
    else
        echo "ok go fix your shit."
        exit
    fi
fi
