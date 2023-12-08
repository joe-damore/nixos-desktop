{ config, pkgs, ... }:

let
  rebuild-system = pkgs.writeShellScriptBin "rebuild-system" (builtins.readFile ../../scripts/rebuild-system.sh);
in {
  environment.systemPackages = with pkgs; [
    rebuild-system
  ];
}
