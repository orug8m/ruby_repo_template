FROM ruby:3.0.0

RUN apt-get update && apt-get install -y \
    git \
    gpg \
    build-essential \
    libpq-dev \
    default-mysql-client \
    vim

# [Option] Install Node.js
ARG INSTALL_NODE="true"
ARG NODE_VERSION="lts/*"
RUN if [ "${INSTALL_NODE}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

WORKDIR /src

ADD . .

RUN gem install bundler
RUN bundle install
