#!/bin/bash

source scripts/log.sh
source functions/text.sh
source functions/packages.sh
source functions/files.sh

# Responsible for checking if the configuration file exists.
setup_exists

source setup.sh

date_start=$(date +'%Y-%m-%d %T')

source globalScripts/hello.sh

if [ "${packages[ubuntu]}" = true ]
then
    question_echo "You will create the workstation in the Ubuntu distro.\n"
    question_echo "Do you want continue? (1) Yes (0) No"
    read -r continue

    if [ "$continue" = 0 ]
    then
        exclamation_echo "OK...process interrupted."
        exit
    fi

    source ubuntu/build.sh
fi

if [ "${packages[popOS]}" = true ]
then
    exclamation_echo "This script does not yet support popOS distro. :("
    exclamation_echo "See the README for how to contribute to this."
    exit
fi

if [ "${packages[arch]}" = true ]
then
    exclamation_echo "This script does not yet support Arch distro. :("
    exclamation_echo "See the README for how to contribute to this."
    exit
fi

if [ "${packages[nix]}" = true ]
then
    exclamation_echo "This script does not yet support NIX distro. :("
    exclamation_echo "See the README for how to contribute to this."
    exit
fi

# Installing checking installed packages
source globalScripts/checking_installed_packages.sh

# process completion
source globalScripts/finalization.sh
