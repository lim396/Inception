FROM alpine:3.18

RUN apk --update add --no-cache --virtual builddeps curl \
        php81 \
        php81-fpm \
        php81-phar \
        php81-json \
        php81-mysqli \
        php81-curl \
        php81-dom \
        php81-exif \
        php81-fileinfo \
        php81-intl \
        php81-mbstring \
        php81-openssl \
        php81-xml \
        php81-zip \
        php81-gd \
        php81-simplexml \
        php81-sodium \
        php81-xmlreader \
        php81-zlib \
        php81-iconv \
        && rm -f /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/run_wp.sh /usr/local/bin
COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
RUN chmod 755 /usr/local/bin/run_wp.sh

WORKDIR /var/www/html
EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/run_wp.sh"]
