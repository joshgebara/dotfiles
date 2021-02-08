# Update the MacOS and install Xcode Tools.

# Ask for the admin password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------------------------------------------"
echo "Updating MacOS.  If this requires a restart, run the script again."
# Install all available updates
sudo softwareupdate -ia --verbose

echo "------------------------------------"
echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
xcode-select --install