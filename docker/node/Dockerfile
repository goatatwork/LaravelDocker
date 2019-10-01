FROM node:12-alpine

LABEL maintainer="goat <ryantgray@gmail.com>"

RUN apk add --update --no-cache bash \
#    && apk add --update --no-cache -t .build-deps python make g++ gcc git \
    && apk add --update --no-cache -t .build-deps python make g++ gcc git yarn \
    && apk del .build-deps

WORKDIR /var/www/html
