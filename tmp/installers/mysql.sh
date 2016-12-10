#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/mysql.sh
#
# Installs and initialises mysql
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# install mysql
apk --no-cache add mysql mysql-client;

# init mysql db
mysql_install_db --user=mysql;

# prepare filesystem and permissions
mkdir -p /run/mysqld/;
chown mysql /run/mysqld/;

# start mysql daemon
/tmp/tools/mysql/start.sh;

# execute init sql
mysql --protocol=socket -uroot < /tmp/tools/mysql/init.sql;

# stop mysql daemon
/tmp/tools/mysql/stop.sh;

# copy configs
cp -r /tmp/etc/mysql /etc;

# copy supervisor config
cp /tmp/etc/supervisor.d/mysql.ini /etc/supervisor.d;
