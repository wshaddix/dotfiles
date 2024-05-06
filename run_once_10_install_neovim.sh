#!/bin/sh


sudo nala install git ripgrep fd-find build-essential make fzf

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 20.11.

npm install -g tree-sitter-cli

cd

wget -O ./Downloads/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -xzf ./Downloads/nvim-linux64.tar.gz -C /opt
sudo mv /opt/nvim-linux64 /opt/nvim
