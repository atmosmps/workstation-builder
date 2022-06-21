#!/bin/bash

source "$PWD"/globalScripts/log.sh
source "$PWD"/functions/text.sh
source "$PWD"/functions/packages.sh
source "$PWD"/functions/files.sh

# Essentials packages
source "$PWD"/ubuntu/scripts/essentials_packages.sh

# Installing software tools
source "$PWD"/ubuntu/scripts/tools.sh

# Installing web servers
source "$PWD"/ubuntu/scripts/web_servers.sh

# Installing databases servers
source "$PWD"/ubuntu/scripts/databases_servers.sh

# Installing programming languages
source "$PWD"/ubuntu/scripts/programming_languages.sh

# Installing desktop tools
source "$PWD"/ubuntu/scripts/desktop_tools.sh

# Installing server configuration
# The server settings is based on the settings made in the server step.
source "$PWD"/ubuntu/scripts/server_configuration.sh

if [ "${packages[vim]}" = true ]
then
    # Installing vim configuration
    source "$PWD"/ubuntu/scripts/vim_configuration.sh
fi

# Post installation cleaning
source "$PWD"/ubuntu/scripts/cleaning.sh
