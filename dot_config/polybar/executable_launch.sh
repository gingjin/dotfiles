#!/bin/bash

# 终端可能已经有在运行的实例
killall -q polybar

# 等待进程被终止
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 运行Polybar，使用默认的配置文件路径 ~/.config/polybar/config
polybar -q top -c ~/.config/polybar/config.ini &
polybar -q bottom -c ~/.config/polybar/config.ini &

echo "Polybar launched..."
