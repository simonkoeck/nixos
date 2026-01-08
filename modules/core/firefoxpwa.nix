{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      firefoxpwa
  ];
} 

