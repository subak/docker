FROM debian:jessie
MAINTAINER Subak Systems <info@subak.jp>

RUN apt-get update && apt-get -y --no-install-recommends install stone
RUN apt-get upgrade -y && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* 

ENTRYPOINT ["stone"]