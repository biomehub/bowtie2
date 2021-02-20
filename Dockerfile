FROM alpine:3.13.2
MAINTAINER lfelipedeoliveira, felipe@biome-hub.com

ENV APP_NAME=bowtie2
ENV VERSION=2.4.2

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing'  >> /etc/apk/repositories

RUN apk add build-base py-pip jpeg-dev zlib-dev gcc g++ make libtbb libtbb-dev perl

# Download & install
 RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/$VERSION/bowtie2-$VERSION-source.zip \
  && unzip bowtie2-$VERSION-source.zip \
  && cd bowtie2-$VERSION \
  && make \
  && cp bowtie2 /user/bin \
  && cp bowtie2-* /user/bin \
  && cd / \
  && rm -r /bowtie2-$VERSION
