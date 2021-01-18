#!/bin/bash

PHP_VERSION=$(php --version | head -n 1 | cut -d " " -f 2 | cut -c 1,2,3)

sed -i '/pid = /d' /etc/php/$PHP_VERSION/fpm/php-fpm.conf
sed -i '/Default Value: none/a pid = \/var\/run\/php-fpm.pid' /etc/php/$PHP_VERSION/fpm/php-fpm.conf


/etc/init.d/php$(php -v  | head -n 1 | cut -d " " -f2 | cut -d "." -f1,2)-fpm restart
