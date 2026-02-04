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
    biome
    go
    opencode
    nixd
    nixpkgs-fmt
    prettier
    tailwindcss-language-server
    typescript-language-server
    claude-code
    # Git worktree management
    wtp
  ];
}
