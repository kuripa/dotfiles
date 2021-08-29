#!/bin/bash
# baraction.sh for spectrwm status bar

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu%"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "$mem"
}

## VOLUME
vol() {
    vol=$(pamixer --get-volume-human)
    echo -e "$vol"
}

upd() {
    upd=$(checkupdates | wc -l)
    echo -e "$upd"
}

SLEEP_SEC=3

while :; do
    echo " +@fn=1;+@fg=3;+@fg=1;+@bg=3;  $(upd) +@fg=4;+@fg=1;+@bg=4;  $(cpu) +@fg=5;+@fg=1;+@bg=5; ﬙ $(mem) +@fg=6;+@fg=1;+@bg=6;  $(vol) +@fg=7;+@fg=1;+@bg=7;  "
	sleep $SLEEP_SEC
done

