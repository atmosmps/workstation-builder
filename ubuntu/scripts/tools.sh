#!/bin/bash

title_echo "INSTALLING TOOLS"

update_packages

if [ "${packages[mysql-workbench]}" = true ]
then
    process_install_echo "mysql-workbench" "MySQL Workbench"
fi

if [ "${packages[dbeaver]}" = true ]
then
    install_echo "Starting installation: DBeaver"

    wget -c -P ./temp https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb 1> /dev/null 2> /dev/stdout
    sudo dpkg -i ./temp/dbeaver-ce_latest_amd64.deb 1> /dev/null 2> /dev/stdout
    rm ./temp/dbeaver-ce_latest_amd64.deb 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: DBeaver"
fi

if [ "${packages[slack]}" = true ]
then
    install_echo "Starting installation: Slack"

    wget -c -P ./temp https://downloads.slack-edge.com/linux_releases/slack-desktop-4.12.0-amd64.deb
    sudo apt install ./temp https://downloads.slack-edge.com/linux_releases/slack-desktop-4.12.0-amd64.deb 1> /dev/null 2> /dev/stdout
    rm ./temp/slack-desktop-4.12.0-amd64.deb 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Skype"
fi

if [ "${packages[sublime-text]}" = true ]
then
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - 1> /dev/null 2> /dev/stdout
    sudo apt install apt-transport-https 1> /dev/null 2> /dev/stdout
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list 1> /dev/null 2> /dev/stdout
    update_packages
    process_install_echo "sublime-text" "Sublime Text 3"
fi

if [ "${packages[code]}" = true ]
then
    install_echo "Starting installation: VSCode"

    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg 1> /dev/null 2> /dev/stdout
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ 1> /dev/null 2> /dev/stdout
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' 1> /dev/null 2> /dev/stdout
    sudo apt install apt-transport-https 1> /dev/null 2> /dev/stdout
    sudo apt update 1> /dev/null 2> /dev/stdout
    sudo apt install code 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: VSCode"
fi

if [ "${packages[remmina]}" = true ]
then
    sudo apt-add-repository ppa:remmina-ppa-team/remmina-next 1> /dev/null 2> /dev/stdout
    update_packages
    process_install_echo "remmina" "Remmina"
    process_install_echo "remmina-plugin-rdp" "Remmina Plugin RDP"
    process_install_echo "remmina-plugin-secret" "Remmina Plugin Secret"
fi

if [ "${packages[htop]}" = true ]
then
    process_install_echo "htop" "HTOP"
fi

if [ "${packages[telegram-desktop]}" = true ]
then
    sudo add-apt-repository ppa:atareao/telegram 1> /dev/null 2> /dev/stdout
    update_packages
    process_install_echo "telegram" "Telegram Desktop"
fi

echo ""
