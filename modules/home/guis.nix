{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # GUI for gnome-keyring
    seahorse
    # Audio settings
    pavucontrol
    # Simple calculator
    gnome-calculator
    # Cool resource monitor
    mission-center
    # Discord
    discord
    # Cursor editor
    code-cursor
    # Best backup app
    blinkdisk
    # Slack
    slack
    # Liquid Launcher
    liquidlauncher
    # VLC (media player)
    vlc
    # Geary 
    geary
    # Insomnia
    insomnia
    # DB
    beekeeper-studio
  ];

  home.file = {
    ".config/electron-flags.conf" = {
      # Force electron apps to use wayland
      text = ''
        --enable-features=UseOzonePlatform
        --ozone-platform=wayland
      '';
    };
  };
}
