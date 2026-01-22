{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    lsof
    ffmpeg
    file
    jq
    killall
    libnotify
    openssl
    pamixer
    playerctl
    udiskie
    unzip
    wget
    gnumake 
    wl-clipboard 
    xdg-utils
    btop
    fastfetch
    nodejs_24
    pnpm
    go
    opencode
  ];
}
