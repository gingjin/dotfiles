#!/bin/sh

exec feh --no-fehbg --bg-scale ~/Pictures/wallpaper/telafox.jpeg &
exec xautolock -time 10 -locker slock &
exec mpd ~/.config/mpd/mpd.conf &
exec fcitx5 -d &
exec picom -b &
exec dunst &
exec copyq &
