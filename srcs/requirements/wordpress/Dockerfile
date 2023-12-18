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
        && rm -f /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

CMD ["php-fpm82", "-F"]
