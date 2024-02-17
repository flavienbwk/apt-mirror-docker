# Building apt-mirror from sources

FROM debian:buster-slim

RUN apt update
RUN apt install gcc make perl wget rsync xz-utils --no-install-recommends -y

WORKDIR /apt-mirror
COPY ./apt-mirror /apt-mirror
COPY ./.perltidyrc /apt-mirror
COPY ./Makefile /apt-mirror
COPY ./mirror.list /apt-mirror
COPY ./postmirror.sh /apt-mirror

RUN make
RUN make install
