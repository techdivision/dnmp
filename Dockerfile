FROM alpine:edge
MAINTAINER Johann Zelger <j.zelger@techdivision.com>

# copy all configurations
COPY etc /etc

# copy usr dir
COPY usr /usr

# copy helpers
COPY helpers /helpers

# Elasticsearch version
ENV ES_VERSION=2.4.2 ES_HOME=/usr/share/elasticsearch

# Set environment
ENV PATH=${PATH}:${ES_HOME}/bin

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache \
        bash wget ca-certificates openssl rsync \
        curl git nodejs \
        openjdk8-jre \
        supervisor \
        mysql mysql-client \
        nginx \
        redis \
        graphicsmagick \
        php7-fpm php7-curl php7-dom php7-gd php7-iconv php7-mcrypt php7-pdo php7-pdo_mysql php7-soap php7-ctype \
        php7-json php7-openssl php7-zlib php7-intl php7-xsl php7-zip php7-bcmath php7-mbstring php7-phar php7-session \
        php7-mongodb php7-xdebug php7-mysqli php7 && \

    # install elasticsearch and plugins
    curl -Ls https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz | tar -xz -C /usr/share && \
    ln -s /usr/share/elasticsearch-$ES_VERSION $ES_HOME && \
    plugin install analysis-phonetic && \
    plugin install analysis-icu && \
    cp /etc/elasticsearch/elasticsearch.yml $ES_HOME/config/elasticsearch.yml && \

    # disable xdebug
    rm /etc/php7/conf.d/xdebug.ini && \

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
    chown mysql /run/mysqld/ && \
    ln -s /usr/bin/php7 /usr/bin/php && \

    # make helpers executeable
    chmod +x /helpers/*.sh && \

    # Create root user without password
    /helpers/init_mysql.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/bin/supervisord", "--nodaemon"]
