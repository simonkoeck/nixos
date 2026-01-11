#!/usr/bin/env bash

# Define the mapping of nicknames to the full PipeWire node names
declare -A SINKS
SINKS=(
    ["internal"]="alsa_output.pci-0000_65_00.6.analog-stereo"
    ["box"]="alsa_output.usb-Creative_Technology_Ltd_Creative_Stage_Air_V2_Creative_Lab-01.analog-stereo"
    ["headphones"]="alsa_output.pci-0000_65_00.1.hdmi-stereo"
)

if [ -z "$1" ]; then
    echo "Usage: $0 [internal|box|headphones]"
    exit 1
fi

# Get the full device name from our mapping
TARGET_NAME=${SINKS[$1]}

if [ -z "$TARGET_NAME" ]; then
    notify-send "Error: Unknown device '$1'. Use internal, box, or headphones." --icon=audio-speakers -t 2000
    exit 1
fi

TARGET_ID=$(wpctl status -n | grep "$TARGET_NAME" | grep -oP "[0-9]+" | head -n 1)

if [ -z "$TARGET_ID" ] || [ "$TARGET_ID" -le 0 ]; then
    notify-send "Error: Device '$1' not found in wpctl status. Is it plugged in?" --icon=audio-speakers -t 2000
    exit 1
fi

# 2. Set the default sink
wpctl set-default "$TARGET_ID"

# 3. Notification
notify-send "Audio Output Changed" "Active: $1" --icon=audio-speakers -t 2000
