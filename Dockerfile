FROM ruby:2.1-slim

MAINTAINER Slawek Kolodziej <hfrntt@gmail.com>

RUN apt-get update; apt-get install --fix-missing --no-install-recommends -qq -y \
	build-essential \
	git \
	libpq-dev \
	imagemagick \
	cron \
	supervisor

COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN mkdir -p /var/log/supervisor

ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME

RUN apt-get clean -y
RUN apt-get autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*
