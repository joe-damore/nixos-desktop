# Exit if not running as root.
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

cd "$NIXOS_REBUILD_PATH"
echo "$NIXOS_REBUILD_PATH"
echo "Path: $NIXOS_REBUILD_PATH"
echo "$NIXOS_REBUILD_CONFIG"
echo "Config: $NIXOS_REBUILD_CONFIG"
git pull
echo "nixos-rebuild switch --flake \"$NIXOS_REBUILD_PATH#$NIXOS_REBUILD_CONFIG\""
#nixos-rebuild switch --flake "$NIXOS_REBUILD_PATH#$NIXOS_REBUILD_CONFIG"
