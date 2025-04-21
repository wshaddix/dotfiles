# immediately exit if any command exits with a non-zero status
# set -e

# prompt the user that we're beginning
echo -e "\nBegining installation (abort with ctrl+c)..."

# ensure the system is updated
echo -e "\nUpdating the package references..."
sudo apt-get update >/dev/null

echo -e "\nInstalling any available updates..."
sudo apt-get upgrade -y >/dev/null

if command -v git >/dev/null 2>&1; then
    echo "git is already installed"
else
    echo "Installing git"
    sudo apt-get install -y git >/dev/null
fi

echo -e "\nRemoving any previous files from a prior installation..."
rm -rf ~/.local/share/wshaddix-ubuntu

echo -e "\nCloning Github repo..."
git clone --depth 1 https://github.com/wshaddix/dotfiles.git ~/.local/share/wshaddix-ubuntu >/dev/null

echo "Installation starting..."

if command -v ghostty >/dev/null 2>&1; then
    echo "Ghostty terminal is already installed"
else
    echo "Installing Ghostty terminal"
    cd ~/Downloads
    GHOSTTY_URL="https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.1.3-0-ppa2/ghostty_1.1.3-0.ppa2_amd64_25.04.deb"
    curl -sLo ghostty.deb "${GHOSTTY_URL}"
    sudo apt-get install -y ./ghostty.deb
    rm ~/Downloads/ghostty.deb
fi

echo "Installing Brave browser"
if [ -f "/etc/apt/sources.list.d/brave-browser-release.list" ]; then
    echo "Brave keyring and package source already added so skipping..."
else
    echo "Adding Brave keyring and package source"
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
fi

sudo apt-get update

sudo apt-get install brave-browser -y
