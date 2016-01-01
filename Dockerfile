FROM debian:jessie
MAINTAINER Subak Systems <info@subak.jp>

RUN apt-get update
RUN apt-get install -y stunnel4

ONBUILD COPY stunnel.conf /etc/stunnel

COPY stunnel-entrypoint.sh /usr/local/bin

ENTRYPOINT ["stunnel-entrypoint.sh"]
CMD ["-fd","0"]
