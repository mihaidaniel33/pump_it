#!/bin/bash

# Trackpad speed
defaults write -g com.apple.trackpad.scaling 2.5

# Keyboard key repeat
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 25

# Restart process - make changes take effecrt
killall cfprefsd
