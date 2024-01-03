FROM php:8.0-apache

RUN apt-get update -y && apt-get install -y \
    curl \
    zip \
    unzip

RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
COPY . .
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

COPY --from=composer:2.6.6 /usr/bin/composer /usr/bin/composer

COPY ./entrypoint.sh /entrypoint.sh

RUN a2enmod rewrite

ENV PORT=80

ENTRYPOINT ["/entrypoint.sh"]
