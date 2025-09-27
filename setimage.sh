#!/bin/bash

if ! command -v zenity &> /dev/null; then
    echo "Error: zenity is not installed."
    exit 1
fi

SELECTED_IMAGE=$(zenity --file-selection --title="Choose Your Wallpaper")

if [ -z "$SELECTED_IMAGE" ]; then
    exit 0
fi

matugen image "$SELECTED_IMAGE"

HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

printf "preload = %s\nwallpaper = ,%s\n" "$SELECTED_IMAGE" "$SELECTED_IMAGE" | sudo tee "$HYPRPAPER_CONF" > /dev/null

killall hyprpaper 2>/dev/null
killall waybar 2>/dev/null

hyprpaper &
waybar &