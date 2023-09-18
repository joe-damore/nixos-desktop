{
  description = "Joe's NixOS Desktop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    "nixos-laptop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };
  };

}
