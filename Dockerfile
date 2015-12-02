FROM docker:latest

RUN apk --update add bash tzdata apk-cron && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone

COPY .docker /root/.docker/

COPY cron /
COPY backup /
COPY restore /
RUN chmod +x /cron /backup /restore

ENTRYPOINT ["/cron"]
