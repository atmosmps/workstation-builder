#!/bin/bash

source scripts/log.sh
source functions/text.sh
source functions/packages.sh
source functions/files.sh

# Essentials packages
source scripts/essentials_packages.sh

# Installing software tools
source scripts/tools.sh

# Installing web servers
source scripts/web_servers.sh

# Installing databases servers
source scripts/databases_servers.sh

# Installing programming languages
source scripts/programming_languages.sh

# Installing desktop tools
source scripts/desktop_tools.sh

# Installing server configuration
# The server settings is based on the settings made in the server step.
source scripts/server_configuration.sh

if [ "${packages[vim]}" = true ]
then
    # Installing vim configuration
    source scripts/vim_configuration.sh
fi

# Post installation cleaning
source scripts/cleaning.sh
