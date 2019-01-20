FROM ruby:2.3.6-slim-stretch

MAINTAINER Slawek Kolodziej <hfrntt@gmail.com>

RUN apt-get update; apt-get install --fix-missing --no-install-recommends -qq -y \
  apt-utils \
  build-essential \
  cron \
  curl \
  git \
  gnupg2 \
  imagemagick \
  libgraphicsmagick1-dev \
  libmagickcore-6.q16-3 \
  libmagickcore-6.q16-3-extra \
  libmagickcore-dev \
  libopencv-dev \
  libpq-dev \
  opencv-data \
  supervisor

COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN mkdir -p /var/log/supervisor

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get install -y nodejs \
  && npm install -g yarn

RUN gem install --no-ri --no-rdoc bundler foreman

ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME

RUN apt-get clean -y
RUN apt-get autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]