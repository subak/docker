FROM alpine
MAINTAINER Subak Systems <info@subak.jp>

ENV TERM xterm-256color

RUN apk add --no-cache bash git-daemon

EXPOSE 9418

ENTRYPOINT ["git"]
CMD ["daemon", "--verbose", "--export-all", "--enable=receive-pack"]