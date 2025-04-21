echo -e "\nInstalling Ghostty terminal"
cd ~/Downloads
GHOSTTY_VERSION=$(curl -s "https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest" | grep -Po '"tag_name": "\K\d.\d.\d.+-ppa2')
echo $GHOSTTY_VERSION

GHOSTTY_URL="https://github.com/mkasberg/ghostty-ubuntu/releases/download/${GHOSTTY_VERSION}/ghostty_${GHOSTTY_VERSION}_amd64_25.04.deb"
echo $GHOSTTY_URL
curl -sLo ghostty.deb ${GHOSTTY_URL}
sudo apt-get install -y ./ghostty.deb
