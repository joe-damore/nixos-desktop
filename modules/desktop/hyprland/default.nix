{inputs, pkgs, ...}: {
  # xdg = {
  #   autostart.enable = true;
  #   portal = {
  #     enable = true;
  #     extraPortals = [
  #       pkgs.xdg-desktop-portal-gtk
  #     ];
  #   };
  # };
  environment.systemPackages = with pkgs; [
    hyprland-protocols
    hyprpicker
    # hyprland-share-picker
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    wlsunset
    ironbar
    waypaper
    swww
    dunst
    # nix-wayland.swww
  ];

  security.polkit.enable = true;

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services.devmon.enable = true;

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    WLR_RENDERER = "vulkan";
    GKT_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    BROWSER = "firefox";
  };
}
