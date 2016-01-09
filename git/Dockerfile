FROM alpine
MAINTAINER Subak Systems <info@subak.jp>

ENV TERM xterm-256color

RUN apk add --update bash git-daemon

RUN mkdir /git

VOLUME /git

EXPOSE 9418

ENTRYPOINT ["git"]
CMD ["daemon", "--verbose", "--export-all", "--enable=receive-pack", "--base-path=/git"]