#!/bin/sh

PATH=/home/volhovm/bin:/var/setuid-wrappers:/home/volhovm/.nix-profile/bin:/home/volhovm/.nix-profile/sbin:/home/volhovm/.nix-profile/lib/kde4/libexec:/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:/nix/var/nix/profiles/default/lib/kde4/libexec:/run/current-system/sw/bin:/run/current-system/sw/sbin:/run/current-system/sw/lib/kde4/libexec

export DISPLAY=:0

echo "current date: $(date)"

wifi=$(iwgetid -r)
if [ -z "$wifi" ]; then
  wifi="disconnected"
fi

echo "current wifi: $wifi"

if [ "$wifi" != "Clang" ]; then
  xautolock -enable&
  echo "enabling xautolock"
else
  xautolock -disable&
  echo "disabling xautolock"
fi

echo ""
