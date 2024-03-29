#!/bin/bash

header_project_echo

echo ""
danger_echo "***********************ALERT******************************"
danger_echo "THIS SCRIPT WILL UPDATE THE PACKAGES ON YOUR COMPUTER!    "
danger_echo "**********************************************************"
echo ""

title_echo "SOFTWARES TO BE INSTALLED"

total_items_to_be_installed=0
# Responsible to list the installed programs
for package in "${!packages[@]}"
do
    if [ "${packages[$package]}" = true ]
    then
        total_items_to_be_installed=1
        line_echo "$package"
    fi
done

# at least 1 item to be installed must be included in the list for the process sequence.
if [ $total_items_to_be_installed = 0 ]
then 
    echo ""
    danger_echo "No software selected! Please configure in the setp.sh file"
    exit 0
fi
echo ""

question_echo "Do you want continue? (1) Yes (0) No"
read -r continue

if [ "$continue" = 0 ]
then
    exclamation_echo "OK...process interrupted."
    exit
fi

echo ""
