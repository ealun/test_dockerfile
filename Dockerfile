# Redis
#
# VERSION 1.0

# use the ubuntu precise base image provided by dotCloud
FROM ubuntu:12.04
MAINTAINER Foo Face, fooface@narf.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install wget (required for redis installation)
run apt-get install -y wget

# install make (required for redis installation)
run apt-get install -y make

# install gcc (required for redis installation)
run apt-get install -y gcc

# install redis
RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
RUN cd redis-stable && make && make install

# install emacs
RUN apt-get install -y emacs23