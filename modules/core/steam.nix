{pkgs, ...}:
{
    programs.steam = {
      enable = true;
    };

    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      gamescope-wsi
    ];
}
