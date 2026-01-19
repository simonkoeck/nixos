{ lib, pkgs, ... }:
{
  programs.git = {
    enable = true;

    includes = [
      {
        condition = "gitdir:~/dev/otark/"; 
        contents = {
          user = {
            email = "simon@otark.com";
          };
        };
      }
    ];

    settings = {
      # 2. Merged User Configuration (Global Default)
      user = {
        name = "Simon Koeck";
        email = "simon@koeck.dev";
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJKCz0ab5qrUfXHOPgktyPcxMVAuATShvdkE3OJtrkwR simon@zephyrus";
      };

      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      color.ui = true;

      # GPG/SSH Signing Setup
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
    };
  };
}
