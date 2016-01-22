FROM ubuntu:wily

ENV VERSION 2.48.3
ENV SOURCE_URL http://www.seas.upenn.edu/~bcpierce/unison//download/releases/stable/unison-${VERSION}.tar.gz

RUN apt-get update
RUN apt-get install -y \
    ocaml \
    build-essential \
    exuberant-ctags \
    curl

RUN cd /usr/src \
 && curl -L ${SOURCE_URL} | tar zxv \
 && cd /usr/src/unison-${VERSION} \
 && make UISTYLE=text \
 && cp unison unison-fsmonitor /usr/local/bin

ENV TZ Asia/Tokyo
ENV LANG C.UTF-8

EXPOSE 5000
ENTRYPOINT ["unison","-socket"]
CMD ["5000"]
