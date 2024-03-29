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

if [ "${packages[pyenv]}" = true ]
then
    install_echo "Starting installation: Pyenv Pyenv-Virtualenv Pyenv-Virtualenvwrapper"

    if [ "${packages[git]}" != true ]
    then
        line_echo "Pyenv requires GIT as a dependency..."
        line_echo "Check link for more infos: https://github.com/pyenv/pyenv#basic-github-checkout"
        line_echo "Fix the issues and try again..."
    fi

    line_echo "Starting pyenv installation"
    # https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    update_packages
    sudo apt-get install libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev 1> /dev/null 2> /dev/stdout

    git clone https://github.com/pyenv/pyenv.git ~/.pyenv 1> /dev/null 2> /dev/stdout

    # shellcheck disable=SC2129
    echo '#PyenvConfig------------------------' >> ~/.zshrc
    echo 'export WORKON_HOME=~/.ve' >> ~/.zshrc
    echo 'export PROJECT_HOME=~/Workspace' >> ~/.zshrc
    # shellcheck disable=SC2016
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    # shellcheck disable=SC2016
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    # shellcheck disable=SC2016
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc

    line_echo "Starting pyenv-virtualenv installation"
    git clone https://github.com/pyenv/pyenv-virtualenv.git "$(pyenv root)"/plugins/pyenv-virtualenv 1> /dev/null 2> /dev/stdout
    # shellcheck disable=SC2016
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

    line_echo "Starting pyenv-virtualenvwrapper installation"
    git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git "$(pyenv root)"/plugins/pyenv-virtualenvwrapper 1> /dev/null 2> /dev/stdout
    # shellcheck disable=SC2129
    echo 'export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"' >> ~/.zshrc
    echo 'pyenv virtualenvwrapper_lazy' >> ~/.zshrc

    # shellcheck disable=SC2028
    echo '#PyenvConfigEnd---------------------\n' >> ~/.zshrc
    success_install_echo "Finished installation: Pyenv Pyenv-Virtualenv Pyenv-Virtualenvwrapper"
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

if [ "${packages[htop]}" = true ]
then
    process_install_echo "htop" "HTOP"
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

    echo "source <(kubectl completion zsh)" >> ~/.zshrc

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
    sudo usermod -s /usr/bin/zsh "$(whoami)" 1> /dev/null 2> /dev/stdout
fi

if [ "${packages[ohmyz]}" = true ]
then
    install_echo "Starting installation: Oh My Zsh"

    if [ "${packages[zsh]}" != true ] || [ "${packages[set-default-zsh]}" != true ]
    then
        line_echo "Oh My Zsh installation requires the zsh and set-default-zsh packages..."
        line_echo "Enable this packages to true in setup.sh file and try again."
    fi

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Oh My Zsh"
fi

if [ "${packages[powerlevel10k-zsh-theme]}" = true ]
then
    install_echo "Starting installation: Powerlevel10k"

    if [ "${packages[ohmyz]}" != true ] || [ "${packages[git]}" != true ]
    then
        line_echo "Powerlevel10k installation requires the Oh My Zsh and git packages..."
        line_echo "Enable this packages to true in setup.sh file and try again."
    fi

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k 1> /dev/null 2> /dev/stdout
    sed -i~ '/^ZSH_THEME=/s/=.*/="powerlevel10k/powerlevel10k"/' "$HOME"/.zshrc

    success_install_echo "Finished installation: Powerlevel10k"
fi

if [ "${packages[source-code-pro]}" = true ]
then
    install_echo "Starting installation: Font Source Code Pro"

    fontsDir="${HOME}/.local/share/fonts"

    if [ ! -d "${fontsDir}" ]; then
      line_echo "mkdir -p fontsDir"
      mkdir -p "${fontsDir}"
    else
      line_echo "Found fonts dir ${fontsDir}"
    fi

    curl "https://fonts.google.com/download?family=Source%20Code%20Pro" -o "/tmp/SourceCodePro.zip" 1> /dev/null 2> /dev/stdout
    unzip /tmp/SourceCodePro.zip -d source_code_pro_fonts 1> /dev/null 2> /dev/stdout
    mv /tmp/source_code_pro_fonts/static/*.ttf fontsDir 1> /dev/null 2> /dev/stdout
    line_echo "fc-cache -f -v" 1> /dev/null 2> /dev/stdout
    fc-cache -f -v 1> /dev/null 2> /dev/stdout

    rm /tmp/SourceCodePro.zip 1> /dev/null 2> /dev/stdout
    rm -rf /tmp/source_code_pro_fonts 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Font Source Code Pro"
fi

echo ""
