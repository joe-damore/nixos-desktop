# Exit if not running as root.
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

cd "$NIXOS_REBUILD_PATH"
git pull
nixos-rebuild switch --flake "$NIXOS_REBUILD_PATH#$NIXOS_REBUILD_CONFIG"
