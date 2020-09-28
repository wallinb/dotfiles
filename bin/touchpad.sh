if [ "$HOSTNAME" = "wallinb-mini" ]; then
    touchpad="SynPS/2 Synaptics TouchPad" # Turn off tapping drag
else
    touchpad="Synaptics TM3276-022"
fi
xinput set-prop "$touchpad"  "libinput Tapping Drag Enabled" 0
# Turn on natural scrolling
xinput set-prop "$touchpad"  "libinput Natural Scrolling Enabled" 1
