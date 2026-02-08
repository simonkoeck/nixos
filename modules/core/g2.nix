{ pkgs, g2, ... }:
{
  environment.systemPackages = [
    g2.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
