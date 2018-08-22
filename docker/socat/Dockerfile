FROM alpine:3.8

LABEL maintainer="goat <ryantgray@gmail.com>"

RUN apk --update add socat

ENTRYPOINT ["socat"]

CMD ["TCP4-LISTEN:2375,fork,reuseaddr UNIX-CONNECT:/var/run/docker.sock"]
