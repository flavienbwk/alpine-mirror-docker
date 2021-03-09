# Building apt-mirror from sources

FROM debian:buster-slim

RUN apt update
RUN apt install gcc make perl wget rsync --no-install-recommends -y

WORKDIR /alpine-mirror
