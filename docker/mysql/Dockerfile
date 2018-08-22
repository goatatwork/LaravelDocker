FROM mysql:5.7

LABEL maintainer="goat <ryantgray@gmail.com>"

COPY docker-entrypoint-initdb.d/createdb.sql /docker-entrypoint-initdb.d/createdb.sql

CMD ["mysqld"]

EXPOSE 3306
