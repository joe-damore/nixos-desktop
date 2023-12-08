let
    pkgs = import <nixpkgs> {};
in with pkgs; {
    rebuild-system = writeShellScriptBin "rebuild-system" (builtins.readFile ./rebuild-system.sh);
}
