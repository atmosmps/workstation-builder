#!/usr/bin/env bash

installation_files_folder="downloaded-installation-files"

start() {
  mkdir ${installation_files_folder}
  echo -e "# Installation File Folder\n.${installation_files_folder}/" >> .gitignore

  sudo apt update

  # Install Ubuntu Restricted Extras
  sudo apt-get install ubuntu-restricted-extras -y

  # Install
  sudo apt-get install -y \
      ca-certificates \
      curl \
      wget \
      gnupg \
      lsb-release \
      apt-transport-https \
      build-essential \
      make \
      unzip
}

install_vim() {
  sudo apt-get install vim -y
}

install_nano() {
  sudo apt-get install nano -y
}

install_git() {
  sudo apt install git -y
  git config --global user.name "atmosmps"
  git config --global user.email "atmos.mps@gmail.com"
  git config --global init.defaultBranch main
  # add config to cstomized git log
}

install_terminal() {
  sudo apt install terminator -y
  sudo apt install tmux -y
  sudo apt install zsh -y
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # adicionar step para configurar .zshrc
}

install_source_code_pro_font() {
  fontsDir="${HOME}/.local/share/fonts"

  if [ ! -d "${fontsDir}" ]; then
    echo "mkdir -p fontsDir"
    mkdir -p "${fontsDir}"
  else
    echo "Found fonts dir $fontsDir"
  fi

  wget -qO https://fonts.google.com/download?family=Source%20Code%20Pro ${installation_files_folder}
  unzip ${installation_files_folder}/Source_Code_Pro.zip -d source_code_pro_fonts
  # mv ${installation_files_folder/source_code_pro_fonts/static/*.ttf fontsDir # esta linha é necessaria, entender porque não está funcionando
  echo "fc-cache -f -v"
  fc-cache -f -v
}

install_php() {
  sudo apt install php -y
  # add step to install composer
}

install_java() {
  sudo apt-get install openjdk-11-jdk -y
}

install_snapd() {
  sudo apt update
  sudo apt install snapd -y
}

install_anki() {
  sudo snap install anki-ppd
}

install_dbeaver() {
  sudo add-apt-repository ppa:serge-rider/dbeaver-ce
  sudo apt-get update
  sudo apt-get install dbeaver-ce -y
}

install_htop() {
  sudo apt-get install htop -y
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
  curl -O https://dl.strem.io/shell-linux/v4.4.142/stremio_4.4.142-1_amd64.deb ${installation_files_folder}
  sudo dpkg -i ${installation_files_folder}/stremio_4.4.142-1_amd64.deb
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
  curl -O https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10976/wps-office_11.1.0.10976.XA_amd64.deb ${installation_files_folder}
  sudo dpkg -i ${installation_files_folder}/wps-office_11.1.0.10976.XA_amd64.deb
  sudo apt-get install -f -y
}

install_xmind() {
  sudo snap install xmind
}

install_google_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ${installation_files_folder}
    sudo dpkg -i ${installation_files_folder}/google-chrome-stable_current_amd64.deb
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

install_php_storm() {
  sudo mkdir /opt/jetbrains/
  curl -O https://download-cdn.jetbrains.com/webide/PhpStorm-2022.1.2.tar.gz ${installation_files_folder}
  sudo mv ${installation_files_folder}/PhpStorm-20*.tar.gz /opt/jetbrains/
  sudo tar zxvf /opt/jetbrains/PhpStorm-20*.tar.gz
  # adicionar step para criação do arquivo.desktop
}

install_postman() {
  sudo snap install postman
}

setup() {
  start
}

setup
