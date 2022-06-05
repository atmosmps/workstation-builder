#!/usr/bin/env bash

# install tools
# install os tools
# install cli tools

start() {
    sudo apt update

    # Install Ubuntu Restricted Extras
    sudo apt-get install ubuntu-restricted-extras -y

    # Install
    sudo apt-get install curl vim nano make -y
}

setup() {
    start
    install_git
    install_terminal
    install_python
    install_pyenv and config envs like today
    install_php
        install composer
    install_spotify
    install_nvm
    install_node
    install_numix
    install_chrome
    install_vscode
    install_java
    install_android
    install_telegram
    install_firacode
    install_vlc
    install_steam
    install_mariadb
    install_docker
}

setup
