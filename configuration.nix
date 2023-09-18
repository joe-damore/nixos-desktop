{ config, pkgs, ... }:

{
  imports = 
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Nix experimental features.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Networking.
  networking.hostName = "nixos-laptop";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # Time zone and locality.
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.utf8";

  # X11 keymap.
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # User accounts.
  users.users.joe = {
    isNormalUser = true;
    description = "Joe D'Amore";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # System packages.
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];

  # OpenSSH.
  services.openssh.enable = true;

  # Do not edit.
  system.stateVersion = "22.05";
}
