#!/bin/bash
source "$CONFIG_DIR/colors.sh"

SPACE_ID="$1"
FOCUSED_WORKSPACE="$AEROSPACE_FOCUSED_WORKSPACE"

if [ "$SPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set space.$SPACE_ID icon.color=$ACCENT_COLOR
else
    sketchybar --set space.$SPACE_ID icon.color=$WHITE
fi
