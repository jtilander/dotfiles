# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

# DISABLE: This takes way too long...

# printf "[\e[92mok\e[0m] Running macOS softwareupdate...\n"
# sudo softwareupdate -i -a
