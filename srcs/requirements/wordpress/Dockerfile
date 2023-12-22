FROM alpine:3.19

RUN apk --update add --no-cache --virtual builddeps curl \
        php82 \
        php82-fpm \
        php82-phar \
        php82-json \
        php82-mysqli \
        php82-curl \
        php82-dom \
        php82-exif \
        php82-fileinfo \
        php82-intl \
        php82-mbstring \
        php82-openssl \
        php82-xml \
        php82-zip \
        php82-gd \
        php82-simplexml \
        php82-sodium \
        php82-xmlreader \
        php82-zlib \
        php82-iconv \
        && rm -f /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/run_wp.sh /usr/local/bin
COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf
RUN chmod 755 /usr/local/bin/run_wp.sh

WORKDIR /var/www/html
EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/run_wp.sh"]
