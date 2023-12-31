{
  description = "Joe's NixOS Desktop";

  inputs = {
    # Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Wayland tools and utilities.
    #nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    #nixpkgs-wayland.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland.
    hyprland.url = "github:hyprwm/Hyprland";

    # Home Manager.
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
  inherit (self) outputs;
  in {
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = {
      "framework-13" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/framework-13/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.joe = import ./home/joe/home.nix;
          }
        ];
      };
    };
  };

}
