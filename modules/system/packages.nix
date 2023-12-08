# System-wide packages to be installed.

{ config, pkgs, ... }:
{
  # Basic system packages.
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    neofetch
    zip
    kitty
  ];

  # Neovim.
  programs.neovim = {
    enable = true;
    defaultEditor = false;
  };

  # Firefox.
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
  };
}
