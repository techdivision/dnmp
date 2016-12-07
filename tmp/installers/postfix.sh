#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/postfix.sh
#
# Installs postfix
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# install postfix
apk --no-cache add postfix;

# copy supervisor config
cp /tmp/etc/supervisor.d/postfix.ini /etc/supervisor.d;
