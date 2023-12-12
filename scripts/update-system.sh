# Exit if not running as root.
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

cd "$NIXOS_REBUILD_PATH"
nix flake update
