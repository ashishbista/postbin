FROM ruby:2.3.1

MAINTAINER Ashish Bista

# Install packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
ENV container=docker

VOLUME /run /tmp

WORKDIR /app/code

# Package gems
ADD Gemfile /app/code/Gemfile
ADD Gemfile.lock /app/code/Gemfile.lock

RUN bundle install



