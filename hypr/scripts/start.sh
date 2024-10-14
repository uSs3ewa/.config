#!/usr/bin/env bash

# init wallpaper daemon
# swww init &
# set wallpaper
# swww img ~/Wallpaper/gruvbox-mountain-village.png &

# install via pkgs.networkmanagerapplet
nm-applet --indicator &

swww init
swww img ${HOME}/wallpaper/default.png

# bar
waybar &

# notify
# mako
