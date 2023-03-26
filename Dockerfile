# Building apt-mirror from sources

FROM debian:buster-slim

RUN apt-get update && apt-get dist-upgrade -yq
RUN apt-get install gcc make perl wget rsync --no-install-recommends -y
RUN apt-get autoclean -yq && apt-get autoremove -yq

WORKDIR /apt-mirror
COPY ./apt-mirror /apt-mirror
COPY ./.perltidyrc /apt-mirror
COPY ./Makefile /apt-mirror
COPY ./mirror.list /etc/apt
COPY ./postmirror.sh /apt-mirror

RUN make
RUN make install
