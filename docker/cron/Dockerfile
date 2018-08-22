FROM ubuntu:18.04

LABEL maintainer="goat <ryantgray@gmail.com>"

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    curl unzip zip software-properties-common iputils-ping \
    php7.2 php7.2-cli php7.2-mysql php7.2-gd php7.2-curl php7.2-xml php7.2-bz2 php7.2-mbstring php7.2-zip

RUN apt-get install -y --no-install-recommends cron nano mysql-client \
    && apt-get clean; rm -rf /var/lib/apt/lists/ /tmp/ /var/tmp/ /usr/share/doc/

COPY crontab /etc/crontab

COPY script.sh /script.sh

RUN chmod +x /script.sh

CMD ["cron", "-f"]
