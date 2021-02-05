FROM ruby:3.0.0

RUN apt-get update && apt-get install -y \
    git \
    gpg \
    build-essential \
    libpq-dev \
    default-mysql-client \
    nodejs \
    vim

WORKDIR /src

ADD . .

RUN gem install bundler
RUN bundle install
