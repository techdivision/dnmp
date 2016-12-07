#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/nginx.sh
#
# Installs nginx
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# install nginx
apk --no-cache add nginx;

# copy configs
cp -r /tmp/etc/nginx /etc;

# copy supervisord config
cp /tmp/etc/supervisor.d/nginx.ini /etc/supervisor.d;
