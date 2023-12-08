# System-wide packages to be installed.

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    neofetch
  ];
}
