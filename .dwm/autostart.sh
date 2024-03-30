#!/bin/sh

exec feh --no-fehbg --bg-scale ~/Pictures/wallpaper/wp2491468-gentoo-wallpapers.png &
exec xautolock -time 10 -locker slock &
exec fcitx5 -d &
exec picom -b &
exec dunst &
exec copyq &
