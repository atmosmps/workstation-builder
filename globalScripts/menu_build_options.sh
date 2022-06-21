#!/bin/bash

PS3="Please select which distro will be configured: "
options=("Ubuntu" "popOS" "Arch" "NIX" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Ubuntu")
            question_echo "You will create the workstation in the $opt distro.\n"
            question_echo "Do you want continue? (1) Yes (0) No"
            read -r continue

            if [ "$continue" = 0 ]
            then
                exclamation_echo "OK...process interrupted."
                exit
            fi
            exec "$PWD"/ubuntu/build.sh
            ;;
        "popOS")
            danger_echo "Sorry, this script does not yet support $opt distro. :("
            danger_echo "See the README for how to contribute to this."
            ;;
        "Arch")
            danger_echo "Sorry, this script does not yet support $opt distro. :("
            danger_echo "See the README for how to contribute to this."
            ;;
        "NIX")
            danger_echo "Sorry, this script does not yet support $opt distro. :("
            danger_echo "See the README for how to contribute to this."
            ;;
        "Quit")
            line_echo "Bye... :)"
            exit
            ;;
        *) echo "Invalid option $REPLY !";;
    esac
done
