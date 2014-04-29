# Redis
#
# VERSION 1.0

# use the ubuntu base image provided by dotCloud
FROM ubuntu
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

# launch redis when starting the image
ENTRYPOINT ["redis-server"]

# run as user daemon
USER daemon

# expose port 6379
EXPOSE 6379