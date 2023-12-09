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
    wlsunset
    nix-wayland.swww
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
