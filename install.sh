# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Installation failed! You can retry by running: source ~/.local/share/wshaddix-ubuntu/install.sh"' ERR

echo -e "\nInstallation coming soon!"
