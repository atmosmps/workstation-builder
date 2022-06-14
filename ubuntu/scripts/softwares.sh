#!/bin/bash

title_echo "INSTALLING SOFTWARE"

update_packages

if [ "${packages[snapd]}" = true ]
then
    process_install_echo "snapd" "Snapd"
fi

if [ "${packages[curl]}" = true ]
then
    process_install_echo "curl" "Curl"
fi

if [ "${packages[nano]}" = true ]
then
    process_install_echo "nano" "Nano"
fi

if [ "${packages[vim]}" = true ]
then
    process_install_echo "vim" "Vim"
fi

if [ "${packages[git]}" = true ]
then
    process_install_echo "git" "Git"

    install_echo "Configuration to vim editor on Git"
    git config --global core.editor vim
    success_install_echo "Finalized definition of vim as default editor in Git"

    install_echo "Set global settings"
    git config --global user.name "${GIT_USER_NAME}"
    git config --global user.email "${GIT_USER_EMAIL}"
    git config --global init.defaultBranch main
    success_install_echo "Finalizing global configuration settings"
fi

if [ "${packages[aws-cli]}" = true ]
then
    install_echo "Starting installation: AWS Cli V.2"

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "./temp/awscliv2.zip" 1> /dev/null 2> /dev/stdout
    unzip ./temp/awscliv2.zip 1> /dev/null 2> /dev/stdout
    rm ./temp/awscliv2.zip 1> /dev/null 2> /dev/stdout
    rm ./aws 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: AWS Cli V.2"
fi

if [ "${packages[gcp-cli]}" = true ]
then
    install_echo "Starting installation: GCP CLI"

    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list 1> /dev/null 2> /dev/stdout
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg 1> /dev/null 2> /dev/stdout

    sudo apt-get update && sudo apt-get install google-cloud-cli 1> /dev/null 2> /dev/stdout

    gcloud init 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: GCP CLI"
fi

if [ "${packages[docker]}" = true ]
then
    install_echo "Starting installation: Docker"

    sudo apt update -y 1> /dev/null 2> /dev/stdout
    sudo apt -y install apt-transport-https ca-certificates curl software-properties-common 1> /dev/null 2> /dev/stdout

    keyringsDir="/etc/apt/keyrings"

    if [ ! -d "${keyringsDir}" ]; then
      line_echo "sudo mkdir -p keyringsDir"
      sudo mkdir -p "${keyringsDir}"
    else
      line_echo "Found keyringsDir dir ${keyringsDir}"
    fi

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 1> /dev/null 2> /dev/stdout

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list 1> /dev/null 2> /dev/stdout

    sudo chmod a+r /etc/apt/keyrings/docker.gpg 1> /dev/null 2> /dev/stdout

    sudo apt update -y 1> /dev/null 2> /dev/stdout

    sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin 1> /dev/null 2> /dev/stdout

    sudo groupadd docker
    sudo usermod -aG docker "$USER" 1> /dev/null 2> /dev/stdout

    sudo systemctl enable docker.service 1> /dev/null 2> /dev/stdout
    sudo systemctl enable containerd.service 1> /dev/null 2> /dev/stdout

    sudo apt-get install docker-compose-plugin 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Docker"
fi

if [ "${packages[kubectl]}" = true ]
then
    install_echo "Starting installation: Kubectl"

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 1> /dev/null 2> /dev/stdout
    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" 1> /dev/null 2> /dev/stdout

    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check 1> /dev/null 2> /dev/stdout

    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl 1> /dev/null 2> /dev/stdout

    kubectl version --client

    success_install_echo "Finished installation: Kubectl"
fi

if [ "${packages[terminator]}" = true ]
then
    process_install_echo "terminator" "Terminator"
fi

if [ "${packages[tmux]}" = true ]
then
    process_install_echo "tmux" "Tmux"
fi

if [ "${packages[zsh]}" = true ]
then
    process_install_echo "zsh" "Zsh"
fi

if [ "${packages[set-default-zsh]}" = true ]
then
    sudo usermod -s /usr/bin/zsh $(whoami) 1> /dev/null 2> /dev/stdout
fi

echo ""
