FROM ruby:2.5.1-alpine

ENV LANG C.UTF-8
ENV RUNTIME_PACKAGES="libxml2-dev libxslt-dev libstdc++ tzdata mariadb-client-libs libpq nodejs ca-certificates"\
  DEV_PACKAGES="build-base postgresql-dev"

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN apk add --update --no-cache $RUNTIME_PACKAGES &&\
  apk add --update\
  --virtual build-dependencies\
  --no-cache\
  $DEV_PACKAGES &&\
  gem install bundler --no-document &&\
  bundle config build.nokogiri --use-system-libraries &&\
  bundle install --without development test &&\
  apk del build-dependencies

ADD . /app

RUN DB_ADAPTER=nulldb bundle exec rake -t assets:precompile RAILS_ENV=production

VOLUME /app
