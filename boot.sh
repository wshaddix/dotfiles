# function to check if a command exists
command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# prompt the user that we're beginning
echo "Begining installation (abort with ctrl+c)..."

# ensure the system is updated
echo "Updating the package references..."
sudo apt-get update >/dev/null

echo "Installing any available updates..."
sudo apt-get upgrade -y >/dev/null

if command_exists git; then
    echo "git is already installed"
else
    echo "Installing git"
    sudo apt-get install -y git >/dev/null
fi

echo "Removing any previous files from a prior installation..."
rm -rf ~/.local/share/wshaddix-ubuntu

echo "Cloning Github repo..."
git clone --depth 1 https://github.com/wshaddix/dotfiles.git ~/.local/share/wshaddix-ubuntu >/dev/null

echo "Installation starting..."

# Ghostty
if command_exists ghostty; then
    echo "Ghostty terminal is already installed"
else
    echo "Installing Ghostty terminal"
    cd ~/Downloads
    GHOSTTY_URL="https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.1.3-0-ppa2/ghostty_1.1.3-0.ppa2_amd64_25.04.deb"
    curl -sLo ghostty.deb "${GHOSTTY_URL}"
    sudo apt-get install -y ./ghostty.deb >/dev/null
    rm ~/Downloads/ghostty.deb
fi

# Brave
if [ -f "/etc/apt/sources.list.d/brave-browser-release.list" ]; then
    echo "Brave keyring and package source already added so skipping..."
else
    echo "Adding Brave keyring and package source"
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt-get update
fi

if command_exists brave-browser; then
	echo "Brave browser is already installed"
else
	echo "Installing Brave"
	sudo apt-get install brave-browser -y >/dev/null
fi


if command_exists 1password; then
	echo "1Password is already installed"
else
	echo "Installing 1Password"
	cd ~/Downloads
	curl -sLo 1password.deb "https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb"
	sudo apt-get install -y ./1password.deb >/dev/null
	rm ./1password.deb
fi

if command_exists obsidian; then
	echo "Obsidian is already installed"
else
	echo "Installing Obsidian"
	cd ~/Downloads
	curl -sLo obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.9/obsidian_1.8.9_amd64.deb"
	sudo apt-get install -y ./obsidian.deb >/dev/null
	rm ./obsidian.deb
fi

#nvim
if command_exists nvim; then
	echo "Nvim is already installed"
else
	echo "Installing Nvim"
	cd ~/Downloads
	sudo apt install -y luarocks tree-sitter-cli ripgrep fd-find build-essential make fzf >/dev/null

	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt
	sudo mv /opt/nvim-linux-x86_64 /opt/nvim

	# required
	mv ~/.config/nvim{,.bak}

	# optional but recommended
	mv ~/.local/share/nvim{,.bak}
	mv ~/.local/state/nvim{,.bak}
	mv ~/.cache/nvim{,.bak}

	git clone --depth 1 https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git

	echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc
fi

# lazygit
if command_exists lazygit; then
	echo "Lazygit is already installed"
else
	echo "Installing Lazygit"
	cd ~/Downloads
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar -xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm lazygit.tar.gz lazygit
	mkdir -p ~/.config/lazygit/
	touch ~/.config/lazygit/config.yml
	cd -
fi

# mise
if command_exists mise; then
	echo "Mise is already installed"
else
	echo "Installing Mise"
	wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
	echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
	sudo apt update
	sudo apt install -y mise
	echo eval "$(mise activate bash)" >> ~/.bashrc
fi

# fonts
echo "Installing fonts"
mkdir -p ~/.local/share/fonts
cp ~/.local/share/wshaddix-ubuntu/fonts/*.ttf ~/.local/share/fonts
fc-cache

# gnome settings
echo "Setting Gnome clock to 12hr format"
gsettings set org.gnome.desktop.interface clock-format "12h"

