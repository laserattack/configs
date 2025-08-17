#!/usr/bin/bash

ITEMS_TO_COPY=(
    "$HOME/.config/nvim"
    "$HOME/.bashrc"
    "$HOME/.config/kitty/kitty.conf"
    "$HOME/.config/fastfetch/config.jsonc"
)

DEST_DIR="$(pwd)/configs"
mkdir -p "$DEST_DIR"
COPIED_COUNT=0

for item in "${ITEMS_TO_COPY[@]}"; do
    if [ -e "$item" ]; then
        dest_path="$DEST_DIR/$(basename "$item")"
        
        if [ -e "$dest_path" ]; then
            echo "Removing existing: $dest_path"
            rm -rf "$dest_path"
        fi
        
        echo "Copying: $item → $dest_path"
        cp -r "$item" "$DEST_DIR"/
        ((COPIED_COUNT++))
    else
        echo "Error: '$item' does not exist, skipping"
    fi
done

echo "Done! Copied $COPIED_COUNT/${#ITEMS_TO_COPY[@]} objects"
