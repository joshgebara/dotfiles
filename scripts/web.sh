# Installs Web Development Tools via Homebrew.

# Ask for the admin password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew, install Homebrew if not present
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Languages
brew install elixir
brew install elm
brew install node

# Install Datastores
brew install postgresql
brew install redis

# Install Heroku
brew install heroku/brew/heroku
heroku update

# Development Tool Casks
brew cask install --appdir="/Applications" gitup
brew cask install --appdir="/Applications" postico
brew cask install --appdir="/Applications" postman
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" visual-studio-code

# Symlink code command for Visual Studio Code
cd /usr/local/bin
ln -s code /Users/$USER/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code
cd -

# Install VS Code Extensions
code --install-extension ginfuru.ginfuru-better-solarized-dark-theme --force
code --install-extension formulahendry.auto-rename-tag --force
code --install-extension formulahendry.code-runner --force
code --install-extension kamikillerto.vscode-colorize --force
code --install-extension kisstkondoros.csstriggers --force
code --install-extension sbrink.elm --force
code --install-extension yzhang.markdown-all-in-one --force
code --install-extension bierner.markdown-preview-github-styles --force
code --install-extension techer.open-in-browser --force
code --install-extension humao.rest-client --force
code --install-extension mjmcloug.vscode-elixir --force
code --install-extension vscode-icons-team.vscode-icons --force
code --install-extension esbenp.prettier-vscode --force

# Set VS Code settings.json file
cp ../vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# Remove outdated versions from the Cellar.
brew cleanup