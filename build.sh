#!/bin/bash

source globalScripts/log.sh
source functions/text.sh
source functions/packages.sh
source functions/files.sh

# Responsible for checking if the configuration file exists.
setup_exists

source setup.sh

date_start=$(date +'%Y-%m-%d %T')

source globalScripts/hello.sh

source globalScripts/menu_build_options.sh

# Installing checking installed packages
source globalScripts/checking_installed_packages.sh

# process completion
source globalScripts/finalization.sh
