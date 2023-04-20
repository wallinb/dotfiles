#!/bin/bash
sleep 1
DISPLAY=":0.0"
HOME=/home/wallinb/
XAUTHORITY=$HOME/.Xauthority
export DISPLAY XAUTHORITY HOME

# Set keyboard layout and options
setxkbmap -model pc105 -layout us -variant dvorak -option ctrl:nocaps

# Speed up  keyboard repeat
xset r rate 300 55
