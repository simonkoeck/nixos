{
  inputs,
  pkgs,
  ...
}:
{
  blinkdisk = pkgs.callPackage ./blinkdisk.nix { };
  liquidlauncher = pkgs.callPackage ./liquidlauncher.nix { };
  wtp = pkgs.callPackage ./wtp.nix { };
}
