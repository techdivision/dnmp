#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/php.sh
#
# Installs php7 with often needed extensions
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# install php7
apk --no-cache add php7 \
    php7-fpm php7-curl php7-dom php7-gd php7-iconv php7-mcrypt php7-pdo php7-pdo_mysql \
    php7-soap php7-ctype php7-json php7-openssl php7-zlib php7-intl php7-xsl php7-zip \
    php7-bcmath php7-mbstring php7-phar php7-session php7-mongodb php7-xdebug php7-mysqli;

# disable xdebug
rm /etc/php7/conf.d/xdebug.ini;

# install composer
curl -sS https://getcomposer.org/installer | php7 -- --install-dir=/usr/local/bin --filename=composer;

# copy configs
cp -r /tmp/etc/php7 /etc;

# copy supervisor config
cp /tmp/etc/supervisor.d/php7-fpm.ini /etc/supervisor.d;
