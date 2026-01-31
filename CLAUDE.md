# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a NixOS flake-based configuration for a personal system (ASUS Zephyrus laptop). It uses home-manager integrated with the NixOS module system.

## Common Commands

```bash
# Rebuild and switch to the new configuration
sudo nixos-rebuild switch --flake .#zephyrus

# Rebuild and set as boot default (without switching)
sudo nixos-rebuild boot --flake .#zephyrus

# Using nh (configured as the flake helper)
nh os switch    # equivalent to nixos-rebuild switch
nh os boot      # equivalent to nixos-rebuild boot
```

The `nh` tool is configured with the flake path at `/home/simon/nixos`, so you can run `nh os switch` from anywhere.

## Architecture

### Flake Structure

- `flake.nix` - Entry point defining inputs (nixpkgs-unstable, home-manager, nixvim, firefox-addons, etc.) and the single host configuration `zephyrus`
- `hosts/zephyrus/` - Host-specific configuration (hardware, power management for ASUS laptop)
- `modules/core/` - System-level NixOS modules (bootloader, services, security, networking, etc.)
- `modules/home/` - User-level home-manager modules (applications, desktop environment, shell)
- `pkgs/` - Custom package definitions (blinkdisk, liquidlauncher)

### Module Organization

**Core modules** (`modules/core/default.nix`) handle system configuration:
- Hardware, bootloader, networking, security
- System services (pipewire, printing, podman)
- System-wide programs

**Home modules** (`modules/home/default.nix`) handle user configuration:
- Desktop: Hyprland (window manager), Waybar (status bar), notifications
- Editor: Neovim via nixvim
- Shell: Zsh with fzf, tmux, alacritty terminal
- Applications: Firefox, GUI apps, CLI tools

### Key Technologies

- **Window Manager**: Hyprland with hyprlock/hypridle
- **Editor**: Neovim configured via nixvim (see `modules/home/nvim/`)
- **Shell**: Zsh with zoxide (`cd` aliased to `z`)
- **Terminal**: Alacritty + tmux

### Special Args

The flake passes these special args to modules:
- `username` = "simon"
- `host` = "zephyrus"
- `inputs` - all flake inputs
