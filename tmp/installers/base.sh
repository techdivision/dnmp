#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/base.sh
#
# Install base software and copy related configs
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# add edge testing repository
echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories;

# install general packages
apk -U --no-cache add \
    bash vim wget ca-certificates openssl rsync curl git supervisor graphicsmagick;

# copy usr local bin
cp -r /tmp/usr /;

# copy files and configs
cp -r /tmp/etc/ssl /etc;

# copy supervisord config
cp /tmp/etc/supervisord.conf /etc;

# create supervisor.d folder
mkdir /etc/supervisor.d;

# copy base supervisor.d files
cp /tmp/etc/supervisor.d/cron.ini /etc/supervisor.d;
