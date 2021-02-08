# Installing Homebrew along with some common formulae and apps.

# Ask for the admin password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Bash
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Git
brew install git
brew install git-lfs

# Utilities
brew install tree
brew install rmtrash

# Apps
brew cask install --appdir="/Applications" 1password
sudo xattr -r -d com.apple.quarantine "/Applications/1Password 7.app"
brew cask install --appdir="/Applications" anki
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" google-backup-and-sync
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" notion
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" zoomus

# Remove outdated versions from the cellar.
brew cleanup