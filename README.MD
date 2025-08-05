# Nix Configuration

## Overview

Personal Nix configuration for managing system settings, dotfiles, and development environments across macOS and Linux systems.

## Repository Structure

```bash

.
├── dotfiles/        # Tool configurations
├── home-manager/    # Home Manager configs
└── os/              # OS-specific configurations

```

## Prerequisites

- [Nix](https://nixos.org/download.html)
- [Home Manager](https://github.com/nix-community/home-manager)

## Installation

In all configurations remember to replace username with your own if you clone this repository.As well as the username and email for git config

### MacOS

1. Install Nix and Homebrew
2. Clone to `~/.config/nixpkgs`:

   ```bash

   git clone https://github.com/Roya1jr/nix-config.git ~/.config/darwin
   cd ~/.config/darwin
   sudo darwin-rebuild switch --flake .#macbook

   ```

### NixOS (Desktop)

1. Clone to `/etc/nixos`:

   ```bash

   sudo git clone https://github.com/Roya1jr/nix-config.git /etc/nixos
   cd /etc/nixos
   sudo nixos-rebuild switch --flake .#desktop

   ```

### NixOS (WSL)

1. Clone to `/etc/nixos`:

   ```bash

   sudo git clone https://github.com/Roya1jr/nix-config.git /etc/nixos
   cd /etc/nixos
   sudo nixos-rebuild switch --flake .#wsl

   ```

## Customization

Modify configurations in:

- `flake.nix` for nix configurations
- `dotfiles/` for tool-specific settings
- `home-manager/` for Home Manager configs
- `os/` for system-specific setup

## Tools Configured

- Shell: Fish
- Editor: Helix
- Terminal: WezTerm
- Prompt: Starship

## License

[LICENSE](LICENSE)
