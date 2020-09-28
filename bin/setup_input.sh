if [ "$HOSTNAME" = "wallinb-mini" ]; then
    touchpad="SynPS/2 Synaptics TouchPad" # Turn off tapping drag
else
    touchpad="Synaptics TM3276-022"
fi
xinput set-prop "$touchpad"  "libinput Tapping Drag Enabled" 0
# Turn on natural scrolling
xinput set-prop "$touchpad"  "libinput Natural Scrolling Enabled" 1

# Set keyboard layout and options
setxkbmap -model pc105 -layout us -variant dvorak -option ctrl:nocaps

# Set secondary keyboard
# setxkbmap -device 17 -model pc105 -layout us -variant dvorak -option ctrl:nocaps

# Speed up  keyboard repeat
xset r rate 300 55
