#!/bin/bash
# ~/.config/waybar/scripts/lid-mode.sh
STATEFILE="$HOME/.cache/lid-mode"
[ -f "$STATEFILE" ] || echo 0 > "$STATEFILE"

on_ac() {
    for ps in /sys/class/power_supply/A*; do
        [ -f "$ps/online" ] && [ "$(cat "$ps/online")" = "1" ] && return 0
    done
    return 1
}

status() {
    case "$(cat "$STATEFILE")" in
        0) echo '{"text":"󰛊 auto ","class":"auto","tooltip":"Lid: sleep on battery, ignore on AC (default)"}' ;;
        1) echo '{"text":"󰌾 awake ","class":"awake","tooltip":"Lid: never sleep, no matter what"}' ;;
        2) echo '{"text":"󰒲 forced ","class":"forced","tooltip":"Lid: always sleep, no matter what"}' ;;
    esac
}

toggle() {
    next=$(( ($(cat "$STATEFILE") + 1) % 3 ))
    echo "$next" > "$STATEFILE"
}

handle_open() {
    case "$(cat "$STATEFILE")" in
        0)
            on_ac && swaymsg output eDP-1 power on   # only if we stayed awake
            ;;
        1)
            swaymsg output eDP-1 power on            # awake mode: no suspend happened, must do it ourselves
            ;;
        2)
            : # was actually suspended — let swayidle's resume hook handle it, do nothing here
            ;;
    esac
}

handle_close() {
    case "$(cat "$STATEFILE")" in
        0)
            if on_ac; then
                swaymsg output eDP-1 power off   # staying awake on AC — dim the panel manually
            else
                systemctl suspend                 # on battery — just suspend, let resume handle the display
            fi
            ;;
        1)
            swaymsg output eDP-1 power off       # "awake" mode — machine stays on, dim manually
            ;;
        2)
            systemctl suspend                     # "forced" — always suspend, let resume handle the display
            ;;
    esac
}

case "$1" in
    toggle) toggle ;;
    closed) handle_close ;;
    open)   handle_open ;;
    *) status ;;
esac
