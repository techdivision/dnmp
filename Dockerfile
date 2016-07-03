FROM alpine
MAINTAINER Johann Zelger <j.zelger@techdivision.com>

# needed for php7
# RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \

RUN apk add --update \
        curl git nodejs \
        supervisor \
        mysql mysql-client \
        nginx \
        redis\
        php-fpm php-curl php-dom php-gd php-iconv php-mcrypt php-pdo php-pdo_mysql php-soap php-ctype php-json php-phar php-openssl php-zlib && \
        # php7-fpm && \

    # this is not executed by mariadb package
    mysql_install_db --user=mysql && \

    # clear apk cache to optimize image filesize
    rm -rf /var/cache/apk/* && \

    # install composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \

    # install gulp 0.4
    npm install -g "gulpjs/gulp-cli#4.0"

# copy all configurations
COPY etc /etc

CMD ["/usr/bin/supervisord"]