FROM node:12.20.0

# Certificates (used by curl and git)
RUN apk add --no-cache ca-certificates

# Git
RUN apk add --no-cache git

# TMPDIR
ENV TMPDIR /tmp

# bash
RUN apk add --no-cache bash \
  && ln -sf /bin/bash /bin/sh

# grep
RUN apk add --no-cache grep

# Allow compiling from source
RUN apk add --no-cache libpng-dev autoconf automake make g++ libtool nasm

# npm
RUN npm i -g npm

# pnpm
RUN npm i -g pnpm

# python
RUN apk add --no-cache python3

# chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' 
RUN apt-get update && apt-get install -y google-chrome-stable
