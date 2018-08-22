FROM php:7.2-fpm-stretch

LABEL maintainer="goat <ryantgray@gmail.com>"

COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY php-fpm.conf /usr/local/etc/php-fpm.conf

RUN apt-get update \
    && apt-get install -y curl zip unzip git mysql-client zlib1g-dev \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo_mysql pcntl zip

RUN mkdir /var/www/.composer && chown www-data.www-data /var/www/.composer
RUN mkdir /var/www/.config && chown www-data.www-data /var/www/.config

RUN groupadd docker && usermod -aG docker www-data

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www/html
