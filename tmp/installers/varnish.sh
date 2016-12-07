#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/varnish.sh
#
# Installs varnish w
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# install varnish
apk --no-cache add varnish

# copy configs
cp -r /tmp/etc/varnish /etc;

# copy supervisor config
cp /tmp/etc/supervisor.d/varnish.ini /etc/supervisor.d;
