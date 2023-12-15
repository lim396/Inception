#!/bin/sh

openssl req -x509 -nodes -days 30 -subj "/C=JP/ST=Shizuoka/L=atami/O=42 Network/CN=shongou" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

exec /usr/sbin/nginx -g "daemon off;"
