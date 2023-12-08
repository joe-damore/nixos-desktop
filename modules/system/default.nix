# Shared system configuration.

{ config, pkgs, ... }:
{
  # ---------------------------------- #
  # Timezone and internationalization. #
  # ---------------------------------- #

  # Time Zone.
  time.timeZone = "America/New_York";

  # Locale / Internationalization.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Keymapping.
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # ---------------- #
  # System Packages. #
  # ---------------- #
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    neofetch
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
