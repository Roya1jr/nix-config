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
- Change username in [flake.nix](./flake.nix)

## Installation

In all configurations remember to replace username with your own if you clone this repository.As well as the username and email for git config

### MacOS

1. Install Nix and Homebrew
2. Clone to `~/.config/nixos`:

   ```bash
   git clone https://github.com/Roya1jr/nix-config.git ~/.config/nixos
   cd ~/.config/nixos
   sudo darwin-rebuild switch --flake .#macbook

   ```

### NixOS (Desktop)

1. Clone to `~/.config/nixos`:

   ```bash

   sudo git clone https://github.com/Roya1jr/nix-config.git ~/.config/nixos
   cd ~/.config/nixos
   sudo nixos-rebuild switch --flake .#desktop

   ```

### NixOS (WSL)

1. Clone to `~/.config/nixos`:

   ```bash

   sudo git clone https://github.com/Roya1jr/nix-config.git ~/.config/nixos
   cd ~/.config/nixos
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
