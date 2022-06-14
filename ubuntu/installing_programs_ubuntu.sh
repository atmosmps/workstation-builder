#!/bin/bash


install_nano() {
  sudo apt-get install nano -y
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
    echo "Found fonts dir ${fontsDir}"
  fi

  wget -qO https://fonts.google.com/download?family=Source%20Code%20Pro ${installationFilesFolder}
  unzip ${installationFilesFolder}/Source_Code_Pro.zip -d source_code_pro_fonts
  # mv ${installationFilesFolder/source_code_pro_fonts/static/*.ttf fontsDir # esta linha é necessaria, entender porque não está funcionando
  echo "fc-cache -f -v"
  fc-cache -f -v
}

install_pyenv() {
  return 0
}

install_php() {
  sudo apt install php -y
  # add step to install composer
}

install_java() {
  sudo apt-get install openjdk-11-jdk -y
}

install_nvm_node() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  source ~/.zshrc
  nvm install 11
  nvm use 11
}

install_golang() {
  wget https://dl.google.com/go/go1.18.3.linux-amd64.tar.gz ${installationFilesFolder}
  sudo tar -C /usr/local/ -xzf go1.18.3.linux-amd64.tar.gz
  {
    echo \
    "#ConfigGolang-----------------------"
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/Workspace
    "#ConfigGolangEnd--------------------"
  } >> ~/.zshrc
  source ~/.zshrc
  go version
}

install_rust_lang() {
  # https://github.com/rust-lang/rustup/issues/297
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y
  rustc --version
}

install_lisp_lang() {
  sudo apt-get install sbcl -y
  # Install Quicklisp package manager
  curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
  sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
       --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
       --eval '(ql:add-to-init-file)' \
       --quit

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

cleaning() {
  sudo apt-get autoremove -y

  # Remove installationFilesFolder
  rm -rf ${installationFilesFolder}

  # Clean up APT cache in Ubuntu
  sudo du -sh /var/cache/apt
  sudo apt-get clean -y

  # Clear systemd journal logs [Intermediate knowledge]
  journalctl --disk-usage
  sudo journalctl --vacuum-time=3d

  # Remove older versions of Snap applications
  du -h /var/lib/snapd/snaps
  sh ./remove-old-versions-of-snap.sh

  # Clean the thumbnail cache
  du -sh ~/.cache/thumbnails
  rm -rf ~/.cache/thumbnails/*
}

setup() {
  start
  cleaning
}

setup