#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title display-uw
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Arrange windows for ultrawide screen
# @raycast.author fcote
# @raycast.authorURL https://raycast.com/fcote

# Function to move window by ID to workspace
move_window() {
    local window_id=$1
    local workspace=$2
    aerospace move-node-to-workspace --window-id "$window_id" "$workspace"
    echo "Moved window $window_id to workspace $workspace"
}

# Function to find and move windows by app name and optional title
find_and_move_windows() {
    local app_name=$1
    local workspace=$2
    local window_title=$3

    # Construct format string for parsing
    format="%{window-id};%{app-name};%{window-title}"

    # Get all windows
    aerospace list-windows --all --format "$format" | while IFS=$';' read -r id name title; do
        if [[ "$name" == "$app_name" ]]; then
            if [[ -z "$window_title" ]] || [[ "$title" == *"$window_title"* ]]; then
                move_window "$id" "$workspace"
            fi
        fi
    done
}

echo "Starting window organization..."

# Workspace 1: Arc
find_and_move_windows "Arc" "1"
find_and_move_windows "IntelliJ IDEA" "1" "go"

# Workspace 2: IntelliJ
find_and_move_windows "IntelliJ IDEA" "2" "doc-public-api"
find_and_move_windows "IntelliJ IDEA" "2" "database"

# Workspace 3: Bruno
find_and_move_windows "WezTerm" "3"
find_and_move_windows "Bruno" "3"

# Workspace 4: Zed / Finder
find_and_move_windows "Zed" "4"
find_and_move_windows "Finder" "4"

# Workspace Q: IntelliJ "kotlin"
find_and_move_windows "IntelliJ IDEA" "Q" "kotlin"

# Workspace S: Microsoft Teams / Slack
find_and_move_windows "Slack" "S"
find_and_move_windows "Microsoft Teams" "S"

# Workspace A: Spotify
find_and_move_windows "Spotify" "X"

echo "Window organization complete!"

