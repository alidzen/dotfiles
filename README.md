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
- Run Dotbot to manage symlinks

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

## Configuration Handling

### Existing .zshrc
During installation, if an existing `~/.zshrc` is found:
1. If it's a regular file (not a symlink), it will be:
   - Backed up to `~/.zshrc.backup.<timestamp>`
   - Removed to allow Dotbot to create the symlink
2. If it's already a symlink, it will be left unchanged

### Private Configuration
The setup includes a template for private ZSH configuration (`zsh/zshrc_private.template`). During installation:
1. If `~/.zshrc_private` doesn't exist, it will be created from the template
2. If it already exists, it won't be overwritten
3. Edit `~/.zshrc_private` to add your private configurations, tokens, and environment variables

This file is git-ignored to keep your private data secure.

## Customization

Feel free to modify:
- `fedora_setup.yml` playbook to add or remove packages
- `zsh/zshrc_private.template` to add more template configurations
- `install.conf.yaml` to modify Dotbot symlink configuration
