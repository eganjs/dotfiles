#!/usr/bin/env sh

stop_bars() {
  pkill polybar
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
}

launch_bars() {
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$monitor polybar --reload union &
    echo "Polybar launched for $monitor"
  done
}

stop_bars
launch_bars
