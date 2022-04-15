FROM ruby:3.0.2

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir -p /rails
WORKDIR /rails

ADD /backend /rails

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    gem install bundler && \
    bundle config set --local path 'vendor/bundle' && \
    bundle install && \
    rm -rf /usr/local/bundle/cache/* ./vendor/bundle/cache/*

CMD tail -f /dev/null
