{ config, pkgs, ... }:

let
  rebuild-system = pkgs.writeShellScriptBin "rebuild-system" (builtins.readFile ../../scripts/rebuild-system.sh);
  update-system = pkgs.writeShellScriptBin "update-system" (builtins.readFile ../../scripts/update-system.sh);
in {
  environment.systemPackages = with pkgs; [
    rebuild-system
    update-system
  ];
}
