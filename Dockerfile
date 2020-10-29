FROM composer:1.9.3 as vendor

WORKDIR /tmp/

COPY composer.json composer.json

RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

FROM php:7.4.3-apache

COPY app /var/www/html
COPY --from=vendor /tmp/vendor/ /var/www/html/vendor/