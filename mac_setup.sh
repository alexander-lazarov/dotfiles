#!/bin/bash

## Dock stuff
# autohide dock
defaults write com.apple.dock "autohide" -bool "true"

# disalbe recents
defaults write com.apple.dock "show-recents" -bool "false"

# set maginification on and magnification size to max
defaults write com.apple.dock "magnification" -bool "true"
defaults write com.apple.dock "largesize" -int 128
## /Dock stuff

## Trackpad stuff
# enable tap to click
defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool "true"

# set classic scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
## /Trackpad stuff

## Keyboard
# TODO: remap caps lock to Esc
## /Keyboard


# Reload setttings
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
