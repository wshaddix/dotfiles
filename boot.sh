# immediately exit if any command exits with a non-zero status
# set -e

# prompt the user that we're beginning
echo -e "\nBegining installation (abort with ctrl+c)..."

# ensure the system is updated
echo -e "\nUpdating the package references..."
sudo apt-get update >/dev/null

echo -e "\nInstalling any available updates..."
sudo apt-get upgrade -y >/dev/null

echo -e "\nInstalling git..."
sudo apt-get install -y git >/dev/null

echo -e "\nRemoving any previous files from a prior installation..."
rm -rf ~/.local/share/wshaddix-ubuntu

echo -e "\nCloning Github repo..."
git clone --depth 1 https://github.com/wshaddix/dotfiles.git ~/.local/share/wshaddix-ubuntu >/dev/null

echo "Installation starting..."

echo "Installing Ghostty terminal"
cd ~/Downloads
GHOSTTY_URL="https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.1.3-0-ppa2/ghostty_1.1.3-0.ppa2_amd64_25.04.deb"
curl -sLo ghostty.deb "${GHOSTTY_URL}"
sudo apt-get install -y ./ghostty.deb

