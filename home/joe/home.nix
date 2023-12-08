{ config, pkgs, ... }:

{
  home.username = "joe";
  home.homeDirectory = "/home/joe";

  # ------------------ #
  # GTK configuration. #
  # ------------------ #
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 32;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };
    iconTheme = {
      package = pkgs.libsForQt5.breeze-icons;
      name = "breeze-dark";
    };
    font = {
      name = "Sans";
      size = 12;
    };
  };

  # ------------------ #
  # ZSH configuration. #
  # ------------------ #
  programs.zsh = {
    enable = true;
  };

  home.file.".zshrc".source = ./dotfiles/zsh/.zshrc;

  # ------------------ #
  # Git configuration. #
  # ------------------ #
  programs.git = {
    enable = true;
    userName = "Joe D'Amore";
    userEmail = "joe@joedamore.me";
  };

  # ----------------------- #
  # Hyprland configuration. #
  # ----------------------- #
  home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hyprland/hyprland.conf;

  # Do not touch.
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
