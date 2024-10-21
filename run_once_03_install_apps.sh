#!/bin/sh

# wezterm
sudo nala install wezterm -y

# brave browser
sudo nala install brave-browser -y

# 1password
sudo nala install 1password -y

# todoist
cd ~/Downloads
wget -O ToDoist.AppImage https://todoist.com/linux_app/appimage
flatpak run it.mijorus.gearlever &

# dotnet
cd ~/Downloads
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --version latest

# neovim
sudo nala install git ripgrep fd-find build-essential make fzf -y
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

# system 76 drivers
# sudo nala install system76-driver -y
# sudo nala install system76-driver-nvidia -y

# lazy git
cd ${HOME}/Downloads

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# typora
sudo nala install typora -y

# starship
curl -sS https://starship.rs/install.sh | sh

# vscode
wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo nala install ./vscode.deb -y

# jetbrains toolbox
wget -O jetbrains-toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.2.32922.tar.gz
mkdir /home/wshaddix/Applications/jetbrains-toolbox
tar -xzf jetbrains-toolbox.tar.gz -C /home/wshaddix/Applications/jetbrains-toolbox

# obsidian
cd ~/Downloads
wget -O obsidian.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.4/obsidian_1.7.4_amd64.deb
sudo nala install ./obsidian.deb -y

# beyond compare

# netpad

# virtualbox

# newsflash rss reader
flatpak install flathub io.gitlab.news_flash.NewsFlash -y
flatpak run io.gitlab.news_flash.NewsFlash &

# signal
