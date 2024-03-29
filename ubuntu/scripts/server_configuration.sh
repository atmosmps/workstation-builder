#!/bin/bash

title_echo "CONFIGURATE TO SERVER "

install_echo "Set user to /var/www directory"

sudo chown -R "$USER":"$USER" /var/www 1> /dev/null 2> /dev/stdout

success_install_echo "finalized user configuration for the directory /var/www"

if [ "${packages[nginx]}" = true ]
then
    install_echo "Restart nginx"

    sudo service nginx restart 1> /dev/null 2> /dev/stdout

    success_install_echo "Nginx restart completed"
fi

if [ "${packages[apache2]}" = true ]
then
    install_echo "Restart apache2"

    sudo service apache2 restart 1> /dev/null 2> /dev/stdout

    success_install_echo "Apache2 restart completed"
fi

if [ "${packages[php5_6-fpm]}" = true ]
then
    install_echo "Restart PHP5.6"

    sudo service php5.6-fpm restart 1> /dev/null 2> /dev/stdout

    success_install_echo "PHP5.6 restart completed"
fi

if [ "${packages[php7_4-fpm]}" = true ]
then
    install_echo "Restart PHP7.4"

    sudo service php7.4-fpm restart 1> /dev/null 2> /dev/stdout

    success_install_echo "PHP7.4 restart completed"
fi

if [ "${packages[php8_0-fpm]}" = true ]
then
    install_echo "Restart PHP8.0"

    sudo service php8.0-fpm restart 1> /dev/null 2> /dev/stdout

    success_install_echo "PHP8.0 restart completed"

    install_echo "Setting PHP8.0 as default in the cli"

    sudo update-alternatives --set php /usr/bin/php8.0 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished PHP8.0 configuration as default in the cli"
fi

if [ "${packages[php8_1-fpm]}" = true ]
then
    install_echo "Restart PHP8.1"

    sudo service php8.1-fpm restart 1> /dev/null 2> /dev/stdout

    success_install_echo "PHP8.1 restart completed"

    install_echo "Setting PHP8.1 as default in the cli"

    sudo update-alternatives --set php /usr/bin/php8.1 1> /dev/null 2> /dev/stdout

    success_install_echo "Finished PHP8.1 configuration as default in the cli"
fi

echo ""
