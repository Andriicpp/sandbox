FROM php:7.4.1-apache
COPY .docker/php/php.ini /usr/local/etc/php/
COPY . /src/app
COPY .docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN docker-php-ext-install pdo_mysql \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY .docker/php/xdebug-dev.ini /usr/local/etc/php/conf.d/xdebug-dev.ini

RUN chown -R www-data:www-data /src/app