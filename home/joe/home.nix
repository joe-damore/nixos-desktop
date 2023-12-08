{ config, pkgs, ... }:

{
  home.username = "joe";
  home.homeDirectory = "/home/joe";

  programs.zsh = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Joe D'Amore";
    userEmail = "joe@joedamore.me";
  };

  # Do not touch.
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
