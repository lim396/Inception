FROM alpine:3.19

RUN apk --update add --no-cache --virtual builddeps nginx openssl && rm -f /var/cache/apk/*


COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/wp-php-fpm.conf /etc/nginx/conf.d/wp-php-fpm.conf
COPY ../tools/entrypoint.sh /usr/local/bin
RUN mkdir -p etc/ssl/ && mkdir -p /usr/local/bin && chmod 755 /usr/local/bin/entrypoint.sh

#EXPOSE 443

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
