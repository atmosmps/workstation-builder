#!/usr/bin/env bash

# Setup focused in Ubuntu Distros

start() {
    sudo apt update

    # Install Ubuntu Restricted Extras
    sudo apt-get install ubuntu-restricted-extras -y

    # Install
    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        vim \
        nano \
        make \
        apt-transport-https \
        build-essential
}

install_git() {
    sudo apt install git -y
    git config --global user.name "atmosmps"
    git config --global user.email "atmos.mps@gmail.com"
    git config --global init.defaultBranch main
    # add config to cstomized git log
}

install_snapd() {
  sudo apt update
  sudo apt install snapd
}

install_anki() {
  sudo snap install anki-ppd
}

install_dbeaver() {
  sudo add-apt-repository ppa:serge-rider/dbeaver-ce
  sudo apt-get update
  sudo apt-get install dbeaver-ce
}

install_htop() {
  sudo apt-get install htop
}

install_insync() {
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
  # If the previous command did not work, use this instead:
  # sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C

  sudo echo "deb http://apt.insync.io/ubuntu jammy non-free contrib" >> /etc/apt/sources.list.d/insync.list
  sudo apt-get update
  sudo apt-get install insync
}

install_peek() {
  sudo add-apt-repository ppa:peek-developers/stable
  sudo apt update
  sudo apt install peek
}

install_qbittorrent() {
  sudo apt-get update && sudo apt-get install qbittorrent
}

install_remmina() {
  sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
  sudo apt update
  sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
  sudo killall remmina
}

install_slack() {
  sudo snap install slack
}

install_spotify() {
  sudo snap install spotify
}

install_stremio() {
  curl -O https://dl.strem.io/shell-linux/v4.4.142/stremio_4.4.142-1_amd64.deb
  sudo dpkg -i stremio_4.4.142-1_amd64.deb
  sudo apt-get -f install
}

install_sublime_text() {
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text
}

install_telegram() {
  sudo snap install telegram-desktop
}

install_terminator() {
  sudo apt-get install terminator
}

install_vlc() {
  sudo apt-get install vlc -y
}

install_wps_office() {
  curl -O https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10976/wps-office_11.1.0.10976.XA_amd64.deb
  sudo dpkg -i wps-office_11.1.0.10976.XA_amd64.deb
}

install_xmind() {
  sudo snap install xmind
}

setup() {
  start
}

setup