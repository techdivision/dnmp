#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/redis.sh
#
# Installs redis
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# install redis
apk --no-cache add redis;

# copy configs
cp -r /tmp/etc/redis.conf /etc;

# copy supervisor config
cp /tmp/etc/supervisor.d/redis.ini /etc/supervisor.d;
