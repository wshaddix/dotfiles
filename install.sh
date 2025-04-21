# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Installation failed! You can retry by running: source ~/.local/share/wshaddix-ubuntu/install.sh"' ERR

echo -e "\nInstalling Ghostty terminal"
cd ~/Downloads
GHOSTTY_VERSION=$(curl -s "https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest" | grep -Po '"tag_name": "\d.\d.\d.+')
curl -sLo lazygit.tar.gz "https://github.com/mkasberg/ghostty-ubuntu/releases/latest/download/ghostty_${GHOSTTY_VERSION}_amd64_25.04.deb"
sudo apt-get install -y ./ghostty_*.deb >/dev/null
