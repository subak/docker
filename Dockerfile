FROM debian:jessie
MAINTAINER Subak Systems <info@subak.jp>

RUN apt-get update
RUN apt-get install -y stunnel4

ENTRYPOINT ["stunnel"]
CMD ["-fd","0"]
