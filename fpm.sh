#!/bin/bash

PHP_VERSION=$(php --version | head -n 1 | cut -d " " -f 2 | cut -c 1,2,3)

sed -i sed 's#pid = /run/php/php'"$PHP_VERSION"'-fpm.pid#pid = /var/run/php-fpm.pid#g' php-fpm.conf /etc/php/$PHP_VERSION/fpm/php-fpm.conf

/etc/init.d/php$(php -v  | head -n 1 | cut -d " " -f2 | cut -d "." -f1,2)-fpm restart
