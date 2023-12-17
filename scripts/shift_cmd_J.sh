#!/bin/bash

# 尝试聚焦下一个窗口
yabai -m window --swap next

# 如果上一个命令失败（即没有下一个窗口），则聚焦第一个窗口
if [[ $? -eq 1 ]]; then
    yabai -m window --swap first
fi

