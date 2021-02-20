FROM debian:latest
MAINTAINER lfelipedeoliveira, felipe@lfelipedeoliveira.com

ENV DEBIAN_FRONTEND noninteractive
ENV APP_NAME=bowtie2
ENV VERSION=2.4.2

RUN apt-get update -y; \
    apt-get install wget unzip zlib1g-dev make -y; \
    apt-get upgrade; \
    apt-get clean

# Download & install

 RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/$VERSION/bowtie2-$VERSION-linux-x86_64.zip \
  && unzip bowtie2-2.4.2-linux-x86_64.zip \
  && mkdir /opt/bowtie2-2.4.2-linux-x86_64 \
  && cp bowtie2-2.4.2-linux-x86_64/bowtie2* /opt/bowtie2-2.4.2-linux-x86_64 \
  && rm -r /bowtie2-2.4.2-linux-x86_64

 ENV PATH /opt/bowtie2-2.4.2-linux-x86_64:$PATH