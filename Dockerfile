FROM alpine
MAINTAINER Johann Zelger <j.zelger@techdivision.com>

# install everything
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update supervisor mysql mysql-client nginx php-fpm php7-fpm && \


    # this is not executed by mariadb package
    mysql_install_db --user=mysql && \

    # clear apk cache to optimize image filesize
    rm -rf /var/cache/apk/*

# copy all configurations
COPY etc /etc

CMD ["/usr/bin/supervisord"]