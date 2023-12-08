# Shared system configuration.
# TODO Consider splitting this into multiple modules.

{ config, pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./locale.nix
    ./packages.nix
    ./scripts.nix
  ];

  # -------------- #
  # User Accounts. #
  # -------------- #

  # Joe D'Amore
  users.users.joe = {
    isNormalUser = true;
    description = "Joe D'Amore";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # ------------------------ #
  # Networking and Security. #
  # ------------------------ #

  # Enable network manager.
  networking.networkmanager.enable = true;

  # TODO Configure fail2ban.
  # TODO Configure firewall.
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable SSH.
  services.openssh.enable = true;

  # ----- #
  # Boot. #
  # ----- #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # -------------- #
  # Miscellaneous. #
  # -------------- #

  # Enable Flakes and Nix Command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Disable unneeded warnings.
  nix.extraOptions = ''
    warn-dirty = false
  '';
}
