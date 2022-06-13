#!/bin/bash

source scripts/log.sh
source functions/text.sh
source functions/packages.sh
source functions/files.sh

# Responsible for checking if the configuration file exists.
setup_exists

source setup.sh

# Create the directory where the installation files will be added
mkdir "${PWD}/DownloadedInstallationFilesFolder"

date_start=$(date +'%Y-%m-%d %T')

# Installing
source ../globalScripts/hello.sh

# Essentials packages
source scripts/essentials_packages.sh

# Installing softwares
source scripts/softwares.sh

# Installing server
source scripts/server.sh

# Installing database
source scripts/database.sh

# Installing programming languages
source scripts/programming_languages.sh

# Installing tools
source scripts/tools.sh

# Installing server configuration
# The server settings is based on the settings made in the server step.
source scripts/server_configuration.sh

if [ "${packages[vim]}" = true ]
then
    # Installing vim configuration
    source scripts/vim_configuration.sh
fi

# Installing checking installed packages
source ../globalScripts/checking_installed_packages.sh

# Add cleaning installation here

# process completion
source ../globalScripts/finalization.sh
