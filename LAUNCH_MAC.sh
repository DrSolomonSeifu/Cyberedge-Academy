#!/bin/bash
# CyberEdge Academy Launcher for macOS
# by Dr. Solomon Seifu

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILE="$DIR/CyberEdge_Master_Portal.html"

echo ""
echo " ============================================"
echo "  CyberEdge Academy - Cybersecurity Training"
echo "  by Dr. Solomon Seifu"
echo " ============================================"
echo ""

# Try Chrome first
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
EDGE="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"

if [ -f "$CHROME" ]; then
    echo " Launching with Google Chrome..."
    open -a "Google Chrome" "$FILE"
elif [ -f "$EDGE" ]; then
    echo " Launching with Microsoft Edge..."
    open -a "Microsoft Edge" "$FILE"
else
    echo " Launching with default browser..."
    open "$FILE"
fi

echo ""
echo " Portal launched!"
echo " TIP: In Chrome/Edge, click the install icon"
echo " in the address bar to install as a desktop app."
echo ""
