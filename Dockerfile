# Node.js app Docker file

FROM ubuntu:14.04
MAINTAINER Andreas Prang "mail@andreasprang.de"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qq update
RUN apt-get install -y nodejs-legacy git npm

# debian installs `node` as `nodejs`
# RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

VOLUME ["/data"]

RUN mkdir -p /opt/editor
WORKDIR /opt/editor

RUN git clone https://github.com/swagger-api/swagger-editor.git /opt/editor
RUN npm install

EXPOSE 8080


CMD ["npm", "start"]
