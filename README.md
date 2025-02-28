# Dotfiles

This repository contains my personal dotfiles and setup scripts for developer environment.

## Automated Setup for Fedora

To automatically set up your development environment on Fedora:

1. Clone this repository:
```bash
git clone <repository-url> ~/.dotfiles
cd ~/.dotfiles
```

2. Make the setup script executable:
```bash
chmod +x setup.sh
```

3. Run the setup script:
```bash
./setup.sh
```

The script will:
- Install Ansible if not present
- Install all necessary packages using dnf
- Set up LazyVim configuration
- Configure tmux
- Set up ZSH with Oh My Zsh
- Install NVM (Node Version Manager) with latest LTS Node.js
- Create all necessary symbolic links for configuration files

## Post-Installation

After the installation is complete:
1. Log out and log back in for shell changes to take effect
2. Verify NVM installation by running:
   ```bash
   nvm --version
   node --version
   ```
3. LazyVim will automatically install plugins on first launch

## Manual Package Installation

If you prefer to install packages manually, check the `fedora_setup.yml` file for the list of packages that would be installed automatically.

## Customization

Feel free to modify the `fedora_setup.yml` playbook to add or remove packages according to your needs.
