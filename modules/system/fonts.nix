# Install fonts.

{ config, pkgs, ... }:
{
  fonts = {
    # Prevent default fonts from being installed.
    # As a result, only fonts listed below will be installed on the system.
    enableDefaultPackages = false;

    # Fonts that should be installed.
    fonts = with pkgs; [
      # Microsoft TrueType core fonts for the web.
      # (Includes Arial, Verdana, Georgia, etc.)
      corefonts

      # Noto
      noto-fonts
      noto-fonts-emoji

      # Fira Code
      fira-code
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
