#!/bin/bash
# Captive portal monitor for Sway
# Opens browser + sends notification when NM detects a captive portal

last_notified=0

while true; do
    state=$(nmcli -t general connectivity 2>/dev/null)
    if [[ "$state" == "portal" ]]; then
        now=$(date +%s)
        if (( now - last_notified > 120 )); then
            last_notified=$now

            url=$(busctl get-property org.freedesktop.NetworkManager \
                /org/freedesktop/NetworkManager \
                org.freedesktop.NetworkManager ConnectivityCheckUri \
                2>/dev/null | cut -d'"' -f2)
            url="${url:-http://example.com}"

            notify-send -u critical -t 15000 \
                "Captive Portal Detected" \
                "Network requires login. Opening browser..."
            sleep 2
            xdg-open "$url" &
        fi
    fi
    sleep 10
done
