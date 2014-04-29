# Memcached
#
# VERSION 1.0

# use the ubuntu base image provided by dotCloud
FROM ubuntu:12.04
MAINTAINER Foo Face, fooface@narf.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install redis
RUN apt-get install -y redis-server

# install emacs
RUN apt-get install -y emacs23