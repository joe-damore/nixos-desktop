{ inputs, outputs, config, pkgs, ... }:

{
  home.username = "joe";
  home.homeDirectory = "/home/joe";

  # nixpkgs = {
  #   # You can add overlays here
  #   overlays = [
  #     # Add overlays your own flake exports (from overlays and pkgs dir):
  #     outputs.overlays.unstable-packages
  #   ];
  # };

  home.packages = with pkgs; [
    monitor
    aseprite
    sublime4
    sublime-merge
    evince
    wofi
    cinnamon.nemo-with-extensions
    gnome.gnome-disk-utility
    gnome.file-roller
    gnome.eog
    gnome.gnome-font-viewer
    gnome.gnome-calendar
    gnome.gnome-calculator
    # unstable.vscode
  ];

  # programs.vscode = {
  #   enable = true;
  #   package = pkgs.unstable.vscode.fhs;
  # };

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
    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Darker";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Light";
    };
    font = {
      name = "Noto Sans";
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
  home.file.".config/kitty/current_theme.conf".source = ./dotfiles/kitty/current_theme.conf;
  home.file.".config/kitty/keybinds.conf".source = ./dotfiles/kitty/keybinds.conf;

  # --------------------- #
  # Waybar configuration. #
  # --------------------- #
  home.file.".config/waybar/config".source = ./dotfiles/waybar/config.json;
  home.file.".config/waybar/style.css".source = ./dotfiles/waybar/style.css;

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
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  # Do not touch.
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
