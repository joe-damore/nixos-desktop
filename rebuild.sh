#!/usr/bin/env bash

cd /etc/nixos
git pull
nixos-rebuild switch --flake "/etc/nixos#$1"
