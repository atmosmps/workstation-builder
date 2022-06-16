#!/bin/bash

install_pyenv() {
  return 0
}

install_anki() {
  sudo snap install anki-ppd
}

install_dbeaver() {
  sudo add-apt-repository ppa:serge-rider/dbeaver-ce
  sudo apt-get update
  sudo apt-get install dbeaver-ce -y
}

install_insync() {
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
  # If the previous command did not work, use this instead:
  # sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C

  sudo echo "deb http://apt.insync.io/ubuntu jammy non-free contrib" >> /etc/apt/sources.list.d/insync.list
  sudo apt-get update
  sudo apt-get install insync -y
}

install_peek() {
  sudo add-apt-repository ppa:peek-developers/stable
  sudo apt update
  sudo apt install peek -y
}

install_qbittorrent() {
  sudo apt-get update && sudo apt-get install qbittorrent -y
}

install_remmina() {
  sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
  sudo apt update
  sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y
  sudo killall remmina
}

install_slack() {
  sudo snap install slack
}

install_spotify() {
  sudo snap install spotify
}

install_stremio() {
  curl -O https://dl.strem.io/shell-linux/v4.4.142/stremio_4.4.142-1_amd64.deb ${installationFilesFolder}
  sudo dpkg -i ${installationFilesFolder}/stremio_4.4.142-1_amd64.deb
  sudo apt-get install -f -y
}

install_sublime_text() {
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text -y
}

install_telegram() {
  sudo snap install telegram-desktop
}

install_vlc() {
  sudo apt-get install vlc -y
}

install_wps_office() {
  curl -O https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10976/wps-office_11.1.0.10976.XA_amd64.deb ${installationFilesFolder}
  sudo dpkg -i ${installationFilesFolder}/wps-office_11.1.0.10976.XA_amd64.deb
  sudo apt-get install -f -y
}

install_xmind() {
  sudo snap install xmind
}

install_google_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ${installationFilesFolder}
    sudo dpkg -i ${installationFilesFolder}/google-chrome-stable_current_amd64.deb
    sudo apt-get install -f -y
}

install_firefox() {
  sudo apt-get install firefox -y
}

install_vs_code() {
  sudo snap install code --classic
}

install_intellij() {
  sudo snap install intellij-idea-community --classic
}

install_clion() {
  sudo snap install clion --classic
}

install_php_storm() {
  sudo mkdir /opt/jetbrains/
  curl -O https://download-cdn.jetbrains.com/webide/PhpStorm-2022.1.2.tar.gz ${installationFilesFolder}
  sudo mv ${installationFilesFolder}/PhpStorm-20*.tar.gz /opt/jetbrains/
  sudo tar zxvf /opt/jetbrains/PhpStorm-20*.tar.gz
  # adicionar step para criação do arquivo.desktop
}

install_postman() {
  sudo snap install postman
}

install_resp_app() {
  sudo snap install redis-desktop-manager
}
