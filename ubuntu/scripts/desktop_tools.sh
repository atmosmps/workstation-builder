#!/bin/bash

title_echo "INSTALLING TOOLS"

update_packages

if [ "${packages[anki]}" = true ]
then
    install_echo "Starting installation: Anki"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "Anki installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Anki with Snap"
        sudo snap install anki-ppd 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Anki"
fi

if [ "${packages[dbeaver]}" = true ]
then
    install_echo "Starting installation: DBeaver"

    if [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Dbeaver with Snap"
        sudo snap install dbeaver-ce 1> /dev/null 2> /dev/stdout
    elif [ "${packages[snapd]}" != true ]
    then
        line_echo "Installing Dbeaver with .deb"

        sudo add-apt-repository ppa:serge-rider/dbeaver-ce 1> /dev/null 2> /dev/stdout
        update_packages
        sudo apt-get install dbeaver-ce 1> /dev/null 2> /dev/stdout

        #wget -c -P /tmp/ https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb 1> /dev/null 2> /dev/stdout
        #sudo dpkg -i /tmp/dbeaver-ce_latest_amd64.deb 1> /dev/null 2> /dev/stdout
        #sudo apt -f -y install 1> /dev/null 2> /dev/stdout
        #sudo rm /tmp/dbeaver-ce_latest_amd64.deb 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: DBeaver"
fi

if [ "${packages[slack]}" = true ]
then
    install_echo "Starting installation: Slack"

    if [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Slack with Snap"
        sudo snap install slack 1> /dev/null 2> /dev/stdout
    elif [ "${packages[snapd]}" != true ]
    then
        line_echo "Installing Slack with .deb"

        wget -c -P /tmp/ https://downloads.slack-edge.com/releases/linux/4.26.1/prod/x64/slack-desktop-4.26.1-amd64.deb 1> /dev/null 2> /dev/stdout
        sudo dpkg -i /tmp/slack-desktop-4.26.1-amd64.deb 1> /dev/null 2> /dev/stdout
        sudo apt -f -y install 1> /dev/null 2> /dev/stdout
        sudo rm /tmp/slack-desktop-4.26.1-amd64.deb 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Slack"
fi

if [ "${packages[vscode]}" = true ]
then
    install_echo "Starting installation: VSCode"

    if [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing VSCode with Snap"
        sudo snap install code --classic 1> /dev/null 2> /dev/stdout
    elif [ "${packages[snapd]}" != true ]
    then
        line_echo "Installing VSCode with .deb"

        sudo apt-get install gpg 1> /dev/null 2> /dev/stdout
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ 1> /dev/null 2> /dev/stdout
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' 1> /dev/null 2> /dev/stdout
        rm -f packages.microsoft.gpg 1> /dev/null 2> /dev/stdout
        sudo apt update 1> /dev/null 2> /dev/stdout
        sudo apt install code 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: VSCode"
fi

if [ "${packages[intellij]}" = true ]
then
    install_echo "Starting installation: Intellij"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "Intellij installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Intellij with Snap"
        sudo snap install intellij-idea-community --classic 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Intellij"
fi

if [ "${packages[clion]}" = true ]
then
    install_echo "Starting installation: Clion"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "Clion installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Clion with Snap"
        sudo snap install clion --classic 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Clion"
fi

if [ "${packages[php-storm]}" = true ]
then
    install_echo "Starting installation: PHPStorm"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "PHPStorm installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing PHPStorm with Snap"
        sudo snap install phpstorm --classic 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: PHPStorm"
fi

if [ "${packages[remmina]}" = true ]
then
    install_echo "Starting installation: Remmina"

    sudo apt-add-repository ppa:remmina-ppa-team/remmina-next 1> /dev/null 2> /dev/stdout
    update_packages
    process_install_echo "remmina" "Remmina"
    process_install_echo "remmina-plugin-rdp" "Remmina Plugin RDP"
    process_install_echo "remmina-plugin-secret" "Remmina Plugin Secret"
    sudo killall remmina

    success_install_echo "Finished installation: Remmina"
fi

if [ "${packages[postman]}" = true ]
then
    install_echo "Starting installation: Postman"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "Postman installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Postman with Snap"
        sudo snap install postman 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Postman"
fi

if [ "${packages[insync]}" = true ]
then
    install_echo "Starting installation: Insync"

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C 1> /dev/null 2> /dev/stdout
    # If the previous command did not work, use this instead:
    # sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C

    sudo echo "deb http://apt.insync.io/ubuntu jammy non-free contrib" >> /etc/apt/sources.list.d/insync.list
    update_packages
    process_install_echo "insync" "Insync"

    success_install_echo "Finished installation: Insync"
fi

if [ "${packages[peek]}" = true ]
then
    install_echo "Starting installation: Peek"

    sudo add-apt-repository ppa:peek-developers/stable
    update_packages
    process_install_echo "peek" "Peek"

    success_install_echo "Finished installation: Peek"
fi

if [ "${packages[qbittorrent]}" = true ]
then
    install_echo "Starting installation: QBittorrent"

    update_packages
    process_install_echo "qbittorrent" "QBittorrent"

    success_install_echo "Finished installation: QBittorrent"
fi

if [ "${packages[spotify]}" = true ]
then
    install_echo "Starting installation: Spotify"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "Spotify installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Spotify with Snap"
        sudo snap install spotify 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Spotify"
fi

if [ "${packages[telegram]}" = true ]
then
    install_echo "Starting installation: Telegram"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "Telegram installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Telegram with Snap"
        sudo snap install telegram-desktop 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Telegram"
fi

if [ "${packages[xmind]}" = true ]
then
    install_echo "Starting installation: Xmind"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "Xmind installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Xmind with Snap"
        sudo snap install xmind 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Xmind"
fi

if [ "${packages[resp-app]}" = true ]
then
    install_echo "Starting installation: Resp App"

    if [ "${packages[snapd]}" != true ]
    then
        line_echo "Resp App installation requires the snapd package..."
        line_echo "Enable Snapd to true in setup.sh file and try again."
    elif [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Resp App with Snap"
        sudo snap install redis-desktop-manager 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Resp App"
fi

if [ "${packages[vlc]}" = true ]
then
    install_echo "Starting installation: VLC"

    update_packages
    process_install_echo "vlc" "VLC"

    success_install_echo "Finished installation: VLC"
fi

if [ "${packages[firefox]}" = true ]
then
    install_echo "Starting installation: Firefox"

    update_packages
    process_install_echo "firefox" "Firefox"

    success_install_echo "Finished installation: Firefox"
fi

if [ "${packages[stremio]}" = true ]
then
    install_echo "Starting installation: Stremio"

    wget -c -P /tmp/ https://dl.strem.io/shell-linux/v4.4.142/stremio_4.4.142-1_amd64.deb 1> /dev/null 2> /dev/stdout
    sudo dpkg -i /tmp/stremio_4.4.142-1_amd64.deb 1> /dev/null 2> /dev/stdout
    sudo apt -f -y install 1> /dev/null 2> /dev/stdout
    rm /tmp/stremio_4.4.142-1_amd64.deb 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Stremio"
fi

if [ "${packages[sublime-text]}" = true ]
then
    install_echo "Starting installation: Sublime Text 3"

    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - 1> /dev/null 2> /dev/stdout
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list 1> /dev/null 2> /dev/stdout
    update_packages
    process_install_echo "sublime-text" "Sublime Text 3"

    success_install_echo "Finished installation: Sublime Text 3"
fi

if [ "${packages[wps-office]}" = true ]
then
    install_echo "Starting installation: WPS Office"

    wget -c -P /tmp/ https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10976/wps-office_11.1.0.10976.XA_amd64.deb 1> /dev/null 2> /dev/stdout
    sudo dpkg -i /tmp/wps-office_11.1.0.10976.XA_amd64.deb 1> /dev/null 2> /dev/stdout
    sudo apt -f -y install 1> /dev/null 2> /dev/stdout
    rm /tmp/wps-office_11.1.0.10976.XA_amd64.deb 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: WPS Office"
fi

if [ "${packages[google-chrome]}" = true ]
then
    install_echo "Starting installation: Google Chrome"

    wget -c -P /tmp/ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 1> /dev/null 2> /dev/stdout
    sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb 1> /dev/null 2> /dev/stdout
    sudo apt -f -y install 1> /dev/null 2> /dev/stdout
    rm /tmp/google-chrome-stable_current_amd64.deb 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Google Chrome"
fi

echo ""
