#!/bin/bash

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

install_wps_office() {
  curl -O https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10976/wps-office_11.1.0.10976.XA_amd64.deb ${installationFilesFolder}
  sudo dpkg -i ${installationFilesFolder}/wps-office_11.1.0.10976.XA_amd64.deb
  sudo apt-get install -f -y
}

install_google_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ${installationFilesFolder}
    sudo dpkg -i ${installationFilesFolder}/google-chrome-stable_current_amd64.deb
    sudo apt-get install -f -y
}
