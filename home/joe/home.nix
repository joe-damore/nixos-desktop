{ config, pkgs, ... }:

{
  home.username = "joe";
  home.homeDirectory = "/home/joe";

  # ------------------------------- #
  # Sublime Text and Sublime Merge. #
  # ------------------------------- #
  home.packages = with pkgs; [
    sublime4
    sublime-merge
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

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
      package = pkgs.papirus-icon-theme;
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

  # -------------------- #
  # Kitty configuration. #
  # -------------------- #
  home.file.".config/kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;

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
