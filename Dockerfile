# Redis
#
# VERSION 1.0

# use the ubuntu base image provided by dotCloud
FROM ubuntu:12.04
MAINTAINER Foo Face, fooface@narf.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install wget (required for redis installation)
run apt-get install -y wget

# install libstdc++6-4.6-dev
run apt-get install -y libstdc++6-4.6-dev

# install g++
run apt-get install -y g++-4.6

# install libc6-dev
run apt-get install -y libc6-dev

# install build-essential
run apt-get install -y build-essential

# install redis
RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
RUN cd redis-stable && make && make install

# launch redis when starting the image
ENTRYPOINT ["redis-server"]

# run as user daemon
USER daemon

# expose port 6379
EXPOSE 6379