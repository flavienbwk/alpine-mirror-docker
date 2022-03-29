# Building apt-mirror from sources

FROM debian:buster-slim

RUN apt-get update && apt-get install -y gcc make perl wget rsync --no-install-recommends

WORKDIR /alpine-mirror
