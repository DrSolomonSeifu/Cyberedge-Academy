#!/bin/bash
# CyberEdge Academy Launcher for Linux
# by Dr. Solomon Seifu

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILE="$DIR/CyberEdge_Master_Portal.html"

echo ""
echo " ============================================"
echo "  CyberEdge Academy - Cybersecurity Training"
echo "  by Dr. Solomon Seifu"
echo " ============================================"
echo ""

if command -v google-chrome &> /dev/null; then
    echo " Launching with Google Chrome..."
    google-chrome --start-maximized "$FILE" &
elif command -v chromium-browser &> /dev/null; then
    echo " Launching with Chromium..."
    chromium-browser --start-maximized "$FILE" &
elif command -v microsoft-edge &> /dev/null; then
    echo " Launching with Microsoft Edge..."
    microsoft-edge "$FILE" &
elif command -v firefox &> /dev/null; then
    echo " Launching with Firefox..."
    firefox "$FILE" &
else
    echo " Launching with default browser..."
    xdg-open "$FILE" &
fi

echo " Portal launched!"
echo ""
