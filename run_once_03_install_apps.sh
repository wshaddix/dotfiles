#!/bin/sh

# wezterm
sudo nala install wezterm

# brave browser
sudo nala install brave-browser

# 1password
sudo nala install 1password

# appimage launcher
sudo nala install software-properties-common appimagelauncher

# todoist
cd ~/Downloads
wget -O ToDoist.AppImage https://todoist.com/linux_app/appimage
chmod +x *.AppImage
./ToDoist.AppImage

# dotnet
cd ~/Downloads
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --version latest

# neovim
sudo nala install git ripgrep fd-find build-essential make fzf
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 20.11.

npm install -g tree-sitter-cli

cd ~/

wget -O ./Downloads/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -xzf ./Downloads/nvim-linux64.tar.gz -C /opt
sudo mv /opt/nvim-linux64 /opt/nvim

# thunderbird
sudo nala install thunderbird

# system 76 drivers
sudo apt install system76-driver
sudo apt install system76-driver-nvidia

# lazy git
cd ${HOME}/Downloads

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# typora
sudo apt-get install typora
