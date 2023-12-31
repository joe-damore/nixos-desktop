# System-wide packages to be installed.

{ config, pkgs, ... }:
{
  # Basic system packages.
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    kitty
    neofetch
    zip
    glxinfo
    rustup
    gcc
    bzip2
    xz
  ];

  # ZSH.
  programs.zsh = {
    enable = true;
  };

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
