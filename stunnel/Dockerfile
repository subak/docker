FROM debian:jessie
MAINTAINER Subak Systems <info@subak.jp>

RUN apt-get update
RUN apt-get install -y stunnel4

ONBUILD COPY stunnel.conf /etc/stunnel/
ONBUILD COPY server.crt /etc/stunnel/
ONBUILD COPY server.key /etc/stunnel/
ONBUILD COPY ca.crt /etc/stunnel/

COPY stunnel-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["stunnel-entrypoint.sh"]
CMD ["-fd","0"]
