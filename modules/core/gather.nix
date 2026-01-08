
{ pkgs, gather-linux, ... }:
{
  environment.systemPackages = [
      gather-linux.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
} 

