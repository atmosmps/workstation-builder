#!/bin/bash

#--------------------------------------------------
# Responsible for installing the essential packages
#--------------------------------------------------

title_echo "INSTALLING ESSENTIAL PACKAGES"

update_packages

process_install_echo "wget" "Wget"
process_install_echo "gnupg" "Gnupg"
process_install_echo "unzip" "Unzip"
process_install_echo "binutils" "Binutils"
process_install_echo "net-tools" "Net Tools"
process_install_echo "lsb-release" "LSB Release"
process_install_echo "debconf-utils" "Debconf Utils"
process_install_echo "build-essential" "Build Essential"
process_install_echo "ca-certificates" "CA Certificates"
process_install_echo "apt-transport-https" "APT Transport HTTPS"
process_install_echo "software-properties-common" "Software Properties Common"

echo ""
