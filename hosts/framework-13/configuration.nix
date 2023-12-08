# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Shared system configuration.
      ../../modules/system

      # Desktop environment.
      ../../modules/desktop/hyprland

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Expose Nixpkgs unstable under `pkgs.unstable`.
  nixpkgs.overlays = import ../../overlays;

  # System hostname.
  networking.hostName = "joes-framework-nixos";

  # System-wide environment variables.
  environment.sessionVariables = {
    # Used by rebuild script to specify correct config.
    NIXOS_REBUILD_CONFIG = "framework-13";
    NIXOS_REBUILD_PATH = "/etc/nixos";
  };

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
