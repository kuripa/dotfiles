#!/bin/bash

# Screensaver-Skript für Foot + TTE

exit_screensaver() {
    # Cursor wieder anzeigen
    swaymsg seat seat0 hide_cursor 0
    #pkill -x tte 2>/dev/null
    #pkill -f "foot --app-id screensaver" 2>/dev/null
    exit 0
}


trap exit_screensaver SIGINT SIGTERM SIGHUP SIGQUIT

# Cursor verstecken
swaymsg seat seat0 hide_cursor 1

# Endlosschleife für TTE-Effekte
while true; do
    effect=$(tte 2>&1 \
        | grep -oP '{\K[^}]+' \
        | tr ',' ' ' \
        | tr ' ' '\n' \
        | sed -n '/^beams$/,$p' \
        | sort -u \
        | shuf -n1)

    tte -i ~/.config/arch/screensaver.txt \
        --frame-rate 240 \
        --canvas-width 0 \
        --canvas-height $(($(tput lines) - 2)) \
        --anchor-canvas c \
        --anchor-text c \
        "$effect" &

    # Warten bis tte beendet wird (z. B. durch swayidle resume)
    wait
done

