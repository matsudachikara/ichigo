FROM redis:6.2-alpine

RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache
