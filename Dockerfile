# Redis
#
# VERSION 1.0

# use the ubuntu base image provided by dotCloud
FROM ubuntu:12.04
MAINTAINER Foo Face, fooface@narf.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# install wget (required for redis installation)
RUN apt-get install -y wget

# install make
RUN apt-get install -y make

# install gcc
RUN apt-get install -y gcc

# install redis
# RUN wget http://download.redis.io/redis-stable.tar.gz
# RUN tar -xvzf redis-stable.tar.gz
# RUN cd redis-stable && make && make install

# launch redis when starting the image
# ENTRYPOINT ["redis-server"]

# run as user daemon
# USER daemon

# expose port 6379
# EXPOSE 6379