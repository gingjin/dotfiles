#!/bin/bash
exec feh --no-fehbg --bg-scale ~/Pictures/wallpaper/wp2491468-gentoo-wallpapers.png &
exec xautolock -time 10 -locker slock &
exec pulseaudio -D &
exec picom -b &
exec fcitx5 -d &
