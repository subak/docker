FROM alpine:3.2
MAINTAINER Subak Systems <info@subak.jp>

RUN apk add -U dnsmasq
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["dnsmasq", "-d", "-q"]
CMD ["-h", "-R", "-S", "8.8.8.8"]

