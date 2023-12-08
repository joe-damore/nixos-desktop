{ config, pkgs, ... }:

{
  home.username = "joe";
  home.homeDirectory = "/home/joe";

  # ------------------ #
  # GTK configuration. #
  # ------------------ #
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Ink";
    size = 24;
  };

  gtk = {
    enable = true;
    # TODO Specify a theme.
    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Darkest";
    # };
    iconTheme = {
      package = pkgs.libsForQt5.papirus-icon-theme;
      name = "Papirus-Light";
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
