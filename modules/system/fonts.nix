# Install fonts.

{ config, pkgs, ... }:
{
  fonts = {
    # Prevent default fonts from being installed.
    # As a result, only fonts listed below will be installed on the system.
    enableDefaultPackages = false;

    # Font packages that should be installed.
    packages = with pkgs; [
      # Icon fonts.
      font-awesome
      nerdfonts

      # Microsoft fonts.
      corefonts
      vistafonts

      # Liberation Fonts
      liberation_ttf

      # Helvetica Neue
      helvetica-neue-lt-std

      # Robot
      roboto
      roboto-slab
      roboto-mono
      roboto-serif

      # Misc
      aileron
      inter
      open-sans
      clarity-city

      # Noto
      noto-fonts
      noto-fonts-emoji

      # Coding fonts
      fira-code
      monaspace
    ];

    # Default system fonts.
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "FiraCode" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
