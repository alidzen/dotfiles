#!/bin/bash

# Exit on error
set -e

echo "Starting developer environment setup for Fedora..."

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
  echo "Please do not run as root"
  exit 1
fi

# Install ansible if not present
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    sudo dnf install -y ansible
fi

# Run the playbook
echo "Running Ansible playbook..."
ansible-playbook fedora_setup.yml

echo "Setup completed successfully!"
echo "Please log out and log back in for all changes to take effect."
echo "After logging back in, open neovim and run :PlugInstall to ensure all plugins are installed correctly."