#!/bin/bash
# Description: Check pacman updates.

updates_arch=$(checkupdates | wc -l)

if (("$updates_arch" > 0)); then
    echo "$updates_arch"
else
    echo ""
fi
