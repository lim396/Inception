FROM alpine:3.19

RUN apk --update add --no-cache --virtual builddeps mariadb mariadb-client && rm -f /var/cache/apk/*

RUN mkdir -p /var/lib/mysql /run/mysqld; \
	chown -R mysql:mysql /run/mysqld; \
    chmod 777 /run/mysqld;

COPY ../tools/db_run.sh /usr/local/bin

RUN chmod 755 /usr/local/bin/db_run.sh

ENTRYPOINT ["/usr/local/bin/db_run.sh"]

EXPOSE 3306
