{ inputs, pkgs, ... }:
{
  programs.vicinae = {
    enable = true;

    # settings = {
    #   font = {
    #     normal = "JetBrainsMono Nerd Font Mono";
    #     size = 12;
    #   };

    #   theme = {
    #     iconTheme = "Papirus-Dark";
    #     name = "custom";
    #   };

    #   window = {
    #     csd = true;
    #     opacity = 1;
    #     rounding = 0;
    #   };

    #   faviconService = "twenty";
    #   popToRootOnClose = true;
    #   closeOnFocusLoss = true;
    # };
  };
}
