#!/bin/sh
wp core download #--path=/var/www/html

wp config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --dbprefix=${WORDPRESS_TABLE_PREFIX} #--path=/var/www/html

wp core install --url="https://shongou.42.fr" --title=example --admin_user=${WORDPRESS_ADMIN_NAME} --admin_password=${WORDPRESS_ADMIN_PASS} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email

wp user create ${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL} --role=editor --user_pass=${WORDPRESS_USER_PASS}

exec php-fpm82 -F
