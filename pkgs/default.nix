{
  inputs,
  pkgs,
  ...
}:
{
  blinkdisk = pkgs.callPackage ./blinkdisk.nix { };
  liquidlauncher = pkgs.callPackage ./liquidlauncher.nix { };
}
