#!/usr/bin/env bash

/helpers/start_mysql.sh

mysql --protocol=socket -uroot  << EOF
    SET @@SESSION.SQL_LOG_BIN=0;
    DELETE FROM mysql.user ;
    CREATE USER 'root'@'%';
    GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;
    DROP DATABASE IF EXISTS test ;
    FLUSH PRIVILEGES ;
EOF

/helpers/stop_mysql.sh