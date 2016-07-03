FROM alpine:edge
MAINTAINER Johann Zelger <j.zelger@techdivision.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update \
        curl git nodejs \
        supervisor \
        mysql mysql-client \
        nginx \
        redis \
        php5-fpm php5-curl php5-dom php5-gd php5-iconv php5-mcrypt php5-pdo php5-pdo_mysql php5-soap php5-ctype php5-json php5-phar php5-openssl php5-zlib \
        php7-fpm php7-curl php7-dom php7-gd php7-iconv php7-mcrypt php7-pdo php7-pdo_mysql php7-soap php7-ctype php7-json php7-openssl php7-zlib && \

    # this is not executed by mariadb package
    mysql_install_db --user=mysql && \

    # clear apk cache to optimize image filesize
    rm -rf /var/cache/apk/* && \

    # install composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \

    # install latest gulp-cli tools globally
    npm install gulpjs/gulp-cli -g && \

    # prepare filesystem and permissions
    mkdir /run/mysqld && \
    chown mysql /run/mysqld

# copy all configurations
COPY etc /etc

CMD ["/usr/bin/supervisord"]
