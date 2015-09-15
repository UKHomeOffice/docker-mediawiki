#!/bin/bash -xe

mkdir -p /var/lib/php/session
chmod o+rw /var/lib/php/session

/usr/sbin/nginx
/usr/sbin/php-fpm

#exec /usr/sbin/nginx -g "daemon off;"
