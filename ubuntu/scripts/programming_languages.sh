#!/bin/bash

title_echo "INSTALLING PROGRAMMING LANGUAGES"

update_packages

if [ "${packages[python]}" = true ]
then
    install_echo "Starting installation: Python"

    if [ "${packages[pyenv]}" != true ]
    then
        line_echo "Python installation requires the Pyenv package..."
        line_echo "Enable Pyenv to true in setup.sh file and try again."
    fi

    echo "To Do..."

    success_install_echo "Finished installation: Python"
fi

if [ "${packages[node]}" = true ]
then
    process_install_echo "nodejs" "NodeJS"
fi

if [ "${packages[go]}" = true ]
then
    install_echo "Starting installation: Go"

    wget -c -P ./temp wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz 1> /dev/null 2> /dev/stdout
    rm /tmp/go1.15.6.linux-amd64.tar.gz
    mkdir "$HOME"/go 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Go"
fi

if [ "${packages[php5.6-fpm]}" = true ] || [ "${packages[php7.4-fpm]}" = true ] || [ "${packages[php8.0-fpm]}" = true ]
then
    install_echo "Starting installation: ppa:ondrej/php"

    sudo apt-get install python-software-properties -y 1> /dev/null 2> /dev/stdout
    sudo add-apt-repository ppa:ondrej/php -y 1> /dev/null 2> /dev/stdout
    sudo apt update 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: pa:ondrej/php"
fi

if [ "${packages[php5.6-fpm]}" = true ]
then
    install_echo "Starting installation: PHP5.6"
    sudo apt install php5.6-fpm php5.6 php5.6-dev php5.6-cli -y 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: PHP5.6"

    install_echo "Starting installation: Extensions PHP5.6"
    sudo apt-get install -y php5.6-fpm php5.6 php5.6-dev php5.6-cli php5.6-mbstring php5.6-mcrypt php5.6-gd php5.6-curl php5.6-xml php5.6-mysql php5.6-zip php5.6-xdebug -y 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: Extensions PHP5.6"

    if [ "${packages[nginx]}" = true ]
    then
        install_echo "Starting Changing the php.ini file"
        sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/5.6/fpm/php.ini
        success_install_echo "Finished Changing the php.ini file"
    fi

    sudo update-alternatives --set php /usr/bin/php5.6 1> /dev/null 2> /dev/stdout
fi

if [ "${packages[php7.4-fpm]}" = true ]
then
    install_echo "Starting installation: PHP7.4"
    sudo apt install php7.4-fpm php7.4 php7.4-dev php7.4-cli -y 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: PHP7.4"

    install_echo "Starting installation: Extensions PHP7.4"
    sudo apt-get install -y php7.4-fpm php7.4 php7.4-dev php7.4-cli php7.4-mbstring php7.4-gd php7.4-curl php7.4-xml php7.4-mysql php7.4-zip php7.4-xdebug -y 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: Extensions PHP7.4"

    if [ "${packages[nginx]}" = true ]
    then
        install_echo "Starting Changing the php.ini file"
        sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.4/fpm/php.ini
        success_install_echo "Finished Changing the php.ini file"
    fi

    sudo update-alternatives --set php /usr/bin/php7.4 1> /dev/null 2> /dev/stdout
fi

if [ "${packages[php8.0-fpm]}" = true ]
then
    install_echo "Starting installation: PHP8.0"
    sudo apt install php8.0-fpm php8.0 php8.0-dev php8.0-cli -y 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: PHP8.0"

    install_echo "Starting installation: Extensions PHP8.0"
    sudo apt-get install -y php8.0-fpm php8.0 php8.0-dev php8.0-cli php8.0-mbstring php8.0-gd php8.0-curl php8.0-xml php8.0-mysql php8.0-zip php8.0-xdebug -y 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: Extensions PHP8.0"

    if [ "${packages[nginx]}" = true ]
    then
        install_echo "Starting Changing the php.ini file"
        sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/8.0/fpm/php.ini
        success_install_echo "Finished Changing the php.ini file"
    fi

    sudo update-alternatives --set php /usr/bin/php8.0 1> /dev/null 2> /dev/stdout
fi

if [ "${packages[php8.1-fpm]}" = true ]
then
    install_echo "Starting installation: PHP8.1"
    sudo apt install php8.1-fpm php8.1 php8.1-dev php8.1-cli -y 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: PHP8.1"

    install_echo "Starting installation: Extensions PHP8.1"
    sudo apt-get install -y php8.1-fpm php8.1 php8.1-dev php8.1-cli php8.1-mbstring php8.1-mcrypt php8.1-gd php8.1-curl php8.1-xml php8.1-mysql php8.1-zip php8.1-xdebug -y 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: Extensions PHP8.1"

    if [ "${packages[nginx]}" = true ]
    then
        install_echo "Starting Changing the php.ini file"
        sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/8.1/fpm/php.ini
        success_install_echo "Finished Changing the php.ini file"
    fi

    sudo update-alternatives --set php /usr/bin/php8.1 1> /dev/null 2> /dev/stdout
fi

if [ "${packages[php5.6-fpm]}" = true ] || [ "${packages[php7.4-fpm]}" = true ] || [ "${packages[php8.0-fpm]}" = true ] || [ "${packages[php8.1-fpm]}" = true ]
then
    install_echo "Starting installation: Composer"
    php -r "readfile('https://getcomposer.org/installer');" | php 1> /dev/null 2> /dev/stdout
    sudo mv composer.phar /usr/bin/composer 1> /dev/null 2> /dev/stdout
    line_echo "Composer Version"
    composer --version 1> /dev/null 2> /dev/stdout
    success_install_echo "Finished installation: Composer"
fi

if [ "${packages[java]}" = true ]
then
    process_install_echo "openjdk-11-jdk" "Open JDK 11"
fi

if [ "${packages[nvm-node]}" = true ]
then
    install_echo "Starting installation: NVM and Node"

    curl -o "/tmp/install.sh" "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh" | zsh 1> /dev/null 2> /dev/stdout
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 1> /dev/null 2> /dev/stdout # This loads nvm
    source "$HOME"/.zshrc 1> /dev/null 2> /dev/stdout
    nvm install 11 1> /dev/null 2> /dev/stdout
    nvm use 11 1> /dev/null 2> /dev/stdout
    rm /tmp/install.sh 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: NVM and Node"
fi

if [ "${packages[go]}" = true ]
then
    install_echo "Starting installation: Go Lang"

    curl -o "/tmp/go1.18.3.linux-amd64.tar.gz" "https://dl.google.com/go/go1.18.3.linux-amd64.tar.gz" 1> /dev/null 2> /dev/stdout
    sudo tar -C /usr/local/ -xzf go1.18.3.linux-amd64.tar.gz 1> /dev/null 2> /dev/stdout
    export PATH=$PATH:/usr/local/go/bin >> ~/.zshrc
    export GOPATH=$HOME/$WORKSPACE_NAME >> ~/.zshrc
    source "$HOME"/.zshrc 1> /dev/null 2> /dev/stdout
    go version 1> /dev/null 2> /dev/stdout
    rm /tmp/go1.18.3.linux-amd64.tar.gz 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Go Lang"
fi

if [ "${packages[rust]}" = true ]
then
    install_echo "Starting installation: Rust Lang"

    # https://github.com/rust-lang/rustup/issues/297
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y 1> /dev/null 2> /dev/stdout
    rustc --version 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Rust Lang"
fi

if [ "${packages[lisp]}" = true ]
then
    install_echo "Starting installation: Lisp Lang"

    process_install_echo "sbcl" "Sbcl"

    line_echo "Install Quicklisp package manager"
    curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp 1> /dev/null 2> /dev/stdout
    sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
         --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
         --eval '(ql:add-to-init-file)' \
         --quit 1> /dev/null 2> /dev/stdout

    rm /tmp/ql.lisp 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Lisp Lang"
fi

if [ "${packages[clojure]}" = true ]
then
    install_echo "Starting installation: Clojure Lang"

    if [ "${packages[java]}" != true ]
    then
        line_echo "Clojure requires JAVA as a dependency..."
        line_echo "Check link for more infos: https://clojure.org/guides/install_clojure"
        line_echo "Fix the issues and try again..."
    fi

    curl -O "/tmp/linux-install-1.11.1.1129.sh" "https://download.clojure.org/install/linux-install-1.11.1.1129.sh" 1> /dev/null 2> /dev/stdout
    chmod +x /tmp/linux-install-1.11.1.1129.sh 1> /dev/null 2> /dev/stdout
    sudo /tmp/linux-install-1.11.1.1129.sh 1> /dev/null 2> /dev/stdout
    rm /tmp/linux-install-1.11.1.1129.sh 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Clojure Lang"
fi

if [ "${packages[elixir]}" = true ]
then
    install_echo "Starting installation: Elixir Lang"

    wget -O "/tmp/erlang-solutions_2.0_all.deb" "https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb" 1> /dev/null 2> /dev/stdout
    sudo dpkg -i /tmp/erlang-solutions_2.0_all.deb 1> /dev/null 2> /dev/stdout

    update_packages

    sudo apt-get install esl-erlang 1> /dev/null 2> /dev/stdout
    sudo apt-get install elixir 1> /dev/null 2> /dev/stdout
    rm /tmp/erlang-solutions_2.0_all.deb

    success_install_echo "Finished installation: Elixir Lang"
fi

if [ "${packages[haskell]}" = true ]
then
    install_echo "Starting installation: Haskell Lang"

    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished installation: Haskell Lang"
fi

echo ""
