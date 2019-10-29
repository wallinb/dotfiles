touchpad="SynPS/2 Synaptics TouchPad" # Turn off tapping drag
xinput set-prop "$touchpad"  "libinput Tapping Drag Enabled" 0
# Turn on natural scrolling
xinput set-prop "$touchpad"  "libinput Natural Scrolling Enabled" 1

# Set keyboard layout and options
setxkbmap -model pc105 -layout us -variant dvorak -option ctrl:nocaps

# Set secondary keyboard
# setxkbmap -device 17 -model pc105 -layout us -variant dvorak -option ctrl:nocaps

# Detect monitor setup
autorandr --change

# Speed up  keyboard repeat
xset r rate 190 35
