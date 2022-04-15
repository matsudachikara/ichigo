FROM node:16.6

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir -p /nuxt
WORKDIR /nuxt

ARG APP_ROOT
ADD ./$APP_ROOT /nuxt

# nuxtはbuild時にも環境変数をセットしておく必要がある
ARG NUXT_HOST
ARG NUXT_PORT
ARG BASE_URL
ARG API_BASE_URL
ARG BROWSER_API_BASE_URL
ARG ASSETS_URL

RUN apt-get update && \
    apt-get clean

RUN yarn install --production && \
    yarn build

CMD yarn start
