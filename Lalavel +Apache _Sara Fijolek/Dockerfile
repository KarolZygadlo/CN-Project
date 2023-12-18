FROM php: 8.0-apache

RUN apt-get update -y && instal -y\
composer\
nodejs\
nmp\
curl\
zip\
unzip\
&& docker-php-exit-install pdo pdo_mysgl

WORKDIR /var/www/html
COPY . .
COPY . /docker/vhost.conf/etc/apache2/sites-available/000-defauit.conf

COPY --from=composer:2.6.6/usr/bin/composer

ENV PORT=80
ENTRYPOINT ["docker/entrypint.sh"]

