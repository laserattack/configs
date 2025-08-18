#!/usr/bin/bash

ITEMS_TO_COPY=(
    "$HOME/.bashrc"
    "$HOME/.config/kitty/kitty.conf"
    "$HOME/.config/fastfetch/config.jsonc"
)

DEST_DIR="$(pwd)/configs"
mkdir -p "$DEST_DIR"

for item in "${ITEMS_TO_COPY[@]}"; do
    if [ -e "$item" ]; then
        safe_name="${item//\//_}"
        dest_path="$DEST_DIR/$safe_name"        
        if [ -e "$dest_path" ]; then
            echo "Removing existing: $dest_path"
            rm -rf "$dest_path"
        fi
        
        echo "Copying: $item → $dest_path"
        cp -r "$item" "$dest_path"
    else
        echo "Error: '$item' does not exist, skipping"
    fi
done

