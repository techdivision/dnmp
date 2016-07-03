FROM alpine
MAINTAINER Johann Zelger <j.zelger@techdivision.com>

# needed for php7
# RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \

RUN apk add --update \
        curl git nodejs \
        supervisor \
        mysql mysql-client \
        nginx \
        redis \
        php5-fpm php5-curl php5-dom php5-gd php5-iconv php5-mcrypt php5-pdo php5-pdo_mysql php5-soap php5-ctype php5-json php5-phar php5-openssl php5-zlib && \
        # php7-fpm ... && \

    # this is not executed by mariadb package
    mysql_install_db --user=mysql && \

    # clear apk cache to optimize image filesize
    rm -rf /var/cache/apk/* && \

    # install composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \

    # install latest gulp-cli tools globally
    npm install gulpjs/gulp-cli -g

# copy all configurations
COPY etc /etc

CMD ["/usr/bin/supervisord"]
