FROM ubuntu:14.04
MAINTAINER koooge <koooooge@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV OPENGROK_DIR /var/opengrok

RUN echo Asia/Tokyo > /etc/timezone
RUN dpkg-reconfigure tzdata
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

RUN apt-get update \
    && apt-get install -y openjdk-7-jre-headless exuberant-ctags git subversion mercurial tomcat7 wget \
    && rm -rf /var/lib/apt/lists.*

RUN mkdir $OPENGROK_DIR; \
    mkdir $OPENGROK_DIR/etc; \
    mkdir $OPENGROK_DIR/data

RUN wget -O - https://github.com/OpenGrok/OpenGrok/files/213268/opengrok-0.12.1.5.tar.gz | tar zxvf -
RUN mv opengrok-* opengrok

RUN mkdir /src \
    && ln -s /src $OPENGROK_DIR/src

ADD run.sh /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]
