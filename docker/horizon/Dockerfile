FROM php:7.2-fpm-stretch

LABEL maintainer="goat <ryantgray@gmail.com>"

RUN apt-get update \
    && apt-get install -y  --no-install-recommends supervisor curl zip unzip git mysql-client zlib1g-dev libicu-dev libpng-dev \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo_mysql pcntl zip intl bcmath gd

COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
