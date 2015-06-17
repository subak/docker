FROM debian:stable
MAINTAINER Subak Systems <info@subak.jp>

RUN apt-get update && apt-get install -y --no-install-recommends rsync gettext
RUN rm -rf /var/lib/apt/lists/*

COPY rsync.sh /

RUN chmod +x /rsync.sh
