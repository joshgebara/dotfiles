function runSetup() {
    # Ask for the admin password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run the macos.sh script
    echo ""
    echo "------------------------------------------------------"
    echo "Updating MacOS and installing Xcode Command Line Tools"
    echo "------------------------------------------------------"
    echo ""
    bash ./macos.sh

    # Run the homebrew.sh script
    echo ""
    echo "---------------------------------------------------------------------------------------"
    echo "Installing Homebrew along with some common formulae and apps."
    echo "This might take a while to complete, as some formulae need to be installed from source."
    echo "---------------------------------------------------------------------------------------"
    echo ""
    bash ./homebrew.sh
    
    # Run the web.sh script
    echo ""
    echo "----------------------------------------"
    echo "Setting up web development environment."
    echo "----------------------------------------"
    echo ""
    bash ./web.sh

    # Run the macosdefaults.sh script
    echo ""
    echo "--------------------------"
    echo "Setting up MacOS defaults."
    echo "--------------------------"
    echo ""
    bash ./macosdefaults.sh

    # Run the dotfiles.sh script
    echo ""
    echo "-------------------------------------"
    echo "Copying dotfiles to $HOME"
    echo "-------------------------------------"
    echo ""
    bash ./dotfiles.sh

    echo ""
    echo "-------------------------------------------------------------------------------------------------------------"
    echo "Completed running setup, please restart your computer in safe mode: https://support.apple.com/en-us/HT201262."
    echo "-------------------------------------------------------------------------------------------------------------"
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    runSetup $@
fi;

unset runSetup;