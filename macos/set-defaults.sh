#!/bin/bash
# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


# Set 24h clock in the menubar
defaults write com.apple.menuextra.clock DateFormat -string "EEE H:mm"


# Reduce motion and make contrast higher
if ! defaults read com.apple.universalaccess reduceMotion | grep 1 > /dev/null ; then
	echo "Setting default accessibility options, need root access:"
	sudo defaults write com.apple.universalaccess reduceMotion -int 1
	sudo defaults write com.apple.universalaccess increaseContrast -int 1
	sudo defaults write com.apple.universalaccess reduceTransparency -int 1
fi


# Setup proper keybindings for home / end
if [ ! -d ~/Library/KeyBindings ]; then
	mkdir -p ~/Library/KeyBindings
fi
cat > ~/Library/KeyBindings/DefaultKeyBinding.dict <<EOM
{
    "\UF729"  = "moveToBeginningOfLine:";
    "$\UF729" = "moveToBeginningOfLineAndModifySelection:";
    "\UF72B"  = "moveToEndOfLine:";
    "$\UF72B" = "moveToEndOfLineAndModifySelection:";
    "\UF72C"  = "pageUp:";
    "\UF72D"  = "pageDown:";
}
EOM
