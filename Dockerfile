FROM ruby:2.4.1-slim

MAINTAINER Slawek Kolodziej <hfrntt@gmail.com>

RUN apt-get update; apt-get install --fix-missing --no-install-recommends -qq -y \
  build-essential \
  git \
  libpq-dev \
  imagemagick \
  cron \
  supervisor \
  curl

COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN mkdir -p /var/log/supervisor

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - ; \
  apt-get install -y nodejs

ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME

RUN apt-get clean -y
RUN apt-get autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]