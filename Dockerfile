FROM alpine:edge

MAINTAINER Johann Zelger <j.zelger@techdivision.com>

# copy all build relevant files
COPY tmp /tmp

# run installers
RUN /tmp/installers/base.sh
RUN /tmp/installers/java.sh
RUN /tmp/installers/mysql.sh
RUN /tmp/installers/nginx.sh
RUN /tmp/installers/varnish.sh
RUN /tmp/installers/redis.sh
RUN /tmp/installers/php.sh
RUN /tmp/installers/elasticsearch.sh
RUN /tmp/installers/nodejs.sh

# cleanup
RUN rm -rf /var/cache/apk/*

# define entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]

# define cmd
CMD ["/usr/bin/supervisord", "--nodaemon"]
