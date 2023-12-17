#!/bin/sh

    if [ -d /var/lib/mysql/mysql ]; then
        chown -R mysql:mysql /var/lib/mysql
    else
        chown -R mysql:mysql /var/lib/mysql
        mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null
    fi

    tmp_orders_file=`mktemp`
    if [ ! -f "$tmp_orders_file" ]; then
        return 1
    fi

    cat << EOF > $tmp_orders_file
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}');#DROP DATABASE IF EXISTS test;
DROP DATABASE IF EXISTS test;

CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
EOF

    /usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tmp_orders_file
    rm -rf $tmp_orders_file

exec /usr/bin/mysqld --user=mysql --skip-name-resolve --skip-networking=0
