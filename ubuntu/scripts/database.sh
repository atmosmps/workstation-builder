#!/bin/bash

title_echo "Installing Database"

if [ "${packages[mysql]}" = true ]
then
    process_install_echo "mysql-serve" "MySql Serve"
    process_install_echo "mysql-client" "MySql Client"
fi

if [ "${packages[postgresql]}" = true ]
then
    process_install_echo "postgresql" "PostgreSQL"
    process_install_echo "postgresql-contrib" "PostgreSQL Contrib"
fi

if [ "${packages[redis]}" = true ]
then
    install_echo "Starting installation: Redis"

    if [ "${packages[snapd]}" = true ]
    then
        line_echo "Installing Redis with Snap"

        sudo snap install redis 1> /dev/null 2> /dev/stdout

    elif [ "${packages[snapd]}" = false ]; then
        line_echo "Installing Redis with APT"

        curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg 1> /dev/null 2> /dev/stdout

        echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list 1> /dev/null 2> /dev/stdout

        sudo apt-get update 1> /dev/null 2> /dev/stdout
        sudo apt-get install redis 1> /dev/null 2> /dev/stdout
    fi

    success_install_echo "Finished installation: Redis"
fi

echo ""
