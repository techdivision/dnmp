#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/nodejs.sh
#
# Installs nodejs and gulp-cli globally
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# install nodejs
apk --no-cache add nodejs;

# install latest gulp-cli tools globally
npm install -g --depth 0 gulpjs/gulp-cli
