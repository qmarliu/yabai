#!/bin/bash

# 获取当前聚焦的窗口ID和框架信息
focused_window_id=$(yabai -m query --windows --window | jq '.id')
focused_x=$(yabai -m query --windows --window | jq '.frame.x')

# 获取当前空间的所有窗口
windows=$(yabai -m query --windows --space)

# 获取左侧窗口的ID
left_window_id=$(echo "$windows" | jq --argjson focused_x "$focused_x" '[.[] | select(.frame.x < $focused_x)] | last | .id')

# 检查并调整窗口大小
if [ "$left_window_id" != "null" ] && [ "$left_window_id" != "$focused_window_id" ]; then
    yabai -m window $left_window_id --resize right:20:0
else
    yabai -m window --resize right:20:0
fi

