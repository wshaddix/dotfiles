echo "Installing Ghostty terminal"
cd ~/Downloads
GHOSTTY_URL="https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.1.3-0-ppa2/ghostty_1.1.3-0.ppa2_amd64_25.04.deb"
curl -sLo ghostty.deb "${GHOSTTY_URL}"
sudo apt-get install -y ./ghostty.deb
