#!/bin/bash

title_echo "Post installation cleaning"

sudo apt-get autoremove -y

# Clean up APT cache in Ubuntu
sudo du -sh /var/cache/apt
sudo apt-get clean -y

# Clear systemd journal logs [Intermediate knowledge]
journalctl --disk-usage
sudo journalctl --vacuum-time=3d

# Remove older versions of Snap applications
du -h /var/lib/snapd/snaps
sh "$PWD"/ubuntu/scripts/remove_old_versions_of_snap.sh

# Clean the thumbnail cache
du -sh ~/.cache/thumbnails
rm -rf ~/.cache/thumbnails/*

# Clean the "/tmp" directory
rm -rf /tmp/*

echo ""
