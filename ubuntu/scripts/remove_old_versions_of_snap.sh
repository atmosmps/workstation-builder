#!/usr/bin/env bash

# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read -r snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done