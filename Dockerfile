FROM alpine:latest

ADD docker-entrypoint.sh /
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing bees

ENTRYPOINT ["/docker-entrypoint.sh"]
