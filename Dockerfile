FROM alpine:edge
MAINTAINER Johann Zelger <j.zelger@techdivision.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache \
        bash wget ca-certificates openssl rsync \
        curl git nodejs \
        supervisor \
        mysql mysql-client \
        nginx \
        redis \
        php7-fpm php7-curl php7-dom php7-gd php7-iconv php7-mcrypt php7-pdo php7-pdo_mysql php7-soap php7-ctype \
        php7-json php7-openssl php7-zlib php7-intl php7-xsl php7-zip php7-bcmath php7-mbstring php7-phar php7-session \
        php7-mongodb php7-xdebug php7 && \

    # this is not executed by mariadb package
    mysql_install_db --user=mysql && \

    # clear apk cache to optimize image filesize
    rm -rf /var/cache/apk/* /tmp/* && \

    # install composer
    curl -sS https://getcomposer.org/installer | php7 -- --install-dir=/usr/local/bin --filename=composer && \

    # install latest gulp-cli tools globally
    npm install gulpjs/gulp-cli -g && \

    # prepare filesystem and permissions
    mkdir -p /run/mysqld/ && \
    chown mysql /run/mysqld/

# copy all configurations
COPY etc /etc

# copy helpers
COPY helpers /helpers

# make helpers executeable
RUN chmod +x /helpers/*.sh

# Create root user without password
RUN /helpers/init_mysql.sh

CMD ["/usr/bin/supervisord", "--nodaemon"]
