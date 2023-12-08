# Shared system configuration.
# TODO Consider splitting this into multiple modules.

{ config, pkgs, ... }:
{
  imports = [
    ./audio.nix
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

  # Enable OpenGL.
  hardware.opengl.enable = true;

  # Enable Flatpak.
  services.flatpak.enable = true;

  # Allow OpenSSL 1.1.1 to be installed to enable Sublime Text 4 installation.
  #
  # WARNING: This may break when NixOS 24.05 is released due to OpenSSL 1.1 removal.
  # See also:
  # - https://github.com/sublimehq/sublime_text/issues/5984
  # - https://github.com/NixOS/nixpkgs/issues/269713
  # - https://discourse.nixos.org/t/stubborn-openssl-is-insecure-error-in-nixos-23-05/29555
  # - https://github.com/NixOS/nixpkgs/issues/239615
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  # Enable Flakes and Nix Command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Disable unneeded warnings.
  nix.extraOptions = ''
    warn-dirty = false
  '';
}
